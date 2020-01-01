DELIMITER $$
CREATE OR REPLACE TRIGGER leave_state_update_check BEFORE UPDATE
 ON `leave`
 FOR EACH ROW
 BEGIN
 IF NEW.state NOT IN ('Pending','Approved','Rejected') THEN
 	SET NEW.state = 'Pending';
 END IF;
 
 IF not new.state = 'Rejected' then
	if datediff(new.date,current_date()) <=0 then
		SIGNAL SQLSTATE '23000'
                SET MESSAGE_TEXT = 'Leave approve or reject is permitted only for future dates';
	end if;
 end if;
 
 END $$
 DELIMITER ;


DELIMITER $$
CREATE OR REPLACE TRIGGER leave_limit_insert_check BEFORE INSERT
 ON pay_grade_leave
 FOR EACH ROW
 BEGIN
 IF NEW.leave_type = 'No-Pay' AND NEW.limit < 50 THEN
 	SET NEW.limit = 50;
 END IF;
 IF NEW.limit < 0 THEN
    SET NEW.limit = 0;
 END IF;
 END $$
 DELIMITER ;


DELIMITER $$
CREATE OR REPLACE TRIGGER leave_limit_update_check BEFORE UPDATE
 ON pay_grade_leave
 FOR EACH ROW
 BEGIN
 IF NEW.leave_type = 'No-Pay' AND NEW.limit < 50 THEN
 	SET NEW.limit = 50;
 END IF;
 IF NEW.limit < 0 THEN
    SET NEW.limit = 0;
 END IF;
 END $$
 DELIMITER ;


DELIMITER $$
CREATE OR REPLACE TRIGGER add_no_pay AFTER INSERT
 ON pay_grade
 FOR EACH ROW
 BEGIN
 	INSERT INTO pay_grade_leave VALUES (NEW.pay_grade,'No-Pay','50');
 END $$
 DELIMITER ;


DELIMITER $$
CREATE OR REPLACE TRIGGER set_custom_attribute_value_to_null AFTER INSERT 
ON custom_attribute
 FOR EACH ROW
 BEGIN
 	DECLARE finished INTEGER DEFAULT 0;
    DECLARE emp_id varchar(50) DEFAULT "";
 
 	DECLARE emp_id_cursor CURSOR FOR SELECT employee_id FROM employee;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
    OPEN emp_id_cursor;
    
    emp_loop: LOOP
    	FETCH emp_id_cursor INTO emp_id;
        IF finished = 1 THEN
        	LEAVE emp_loop;
        END IF;
        INSERT INTO employee_custom_attributes VALUES (emp_id, NEW.attribute,null); 
 	END LOOP emp_loop;
 END $$
 DELIMITER ;


DELIMITER $$

CREATE OR REPLACE TRIGGER employee_before_insert BEFORE INSERT
ON employee
FOR EACH ROW
BEGIN

	select access_level into @a_level from job_title where job_title = NEW.job_title;
	IF @a_level is null then
		SIGNAL SQLSTATE '23000'
                SET MESSAGE_TEXT = 'Invalid Job Title';
    END IF;
	
	if @a_level = "L3" then
	
		IF EXISTS(SELECT * FROM employee WHERE job_title = new.job_title AND active_status=1) THEN
				SIGNAL SQLSTATE '23000'
					SET MESSAGE_TEXT = 'Can not insert, employee with L3 access level already exists';
		END IF;
	
	end if;
	
	if New.marital_status NOT IN ('Single','Married','Divorced') then
		set new.marital_status = '';
	end if;

	if New.gender NOT IN ('Male','Female','Prefer not to say') then
		set new.gender = 'Prefer not to say';
	end if;

	
	set new.active_status = 1;
   	
END $$

DELIMITER ;


DELIMITER $$

CREATE OR REPLACE TRIGGER no_delete_L3 BEFORE DELETE
ON job_title
FOR EACH ROW
BEGIN
	IF OLD.access_level = 'L3' THEN
    	SIGNAL SQLSTATE 'HY000'
             SET MESSAGE_TEXT = 'Deleting L3 job title is not allowed';
	END IF;
    
END $$

DELIMITER ;


DELIMITER $$

CREATE OR REPLACE TRIGGER job_title_before_insert BEFORE INSERT
ON job_title
FOR EACH ROW
BEGIN

	
	
	if New.access_level NOT IN ('Admin','L1','L2','L3') then
		SIGNAL SQLSTATE '23000'
					SET MESSAGE_TEXT = 'Invalid access level';
	end if;
	
	if new.access_level = 'L3' then
	
		IF EXISTS(SELECT * FROM job_title WHERE access_level = 'L3') THEN
			SIGNAL SQLSTATE '23000'
						SET MESSAGE_TEXT = 'Multiple job titles with L3 access_level ';
		end if;
		
		if not new.job_title = "Human Resources Manager" then 
			SIGNAL SQLSTATE '23000'
						SET MESSAGE_TEXT = 'L3 level job title should be Human Resources Manager';
		
		end if;
	
	end if;	
	
    	
END $$

DELIMITER ;



DELIMITER $$

CREATE OR REPLACE TRIGGER job_title_before_update BEFORE UPDATE
ON job_title
FOR EACH ROW
BEGIN

	
	
	if New.access_level NOT IN ('Admin','L1','L2','L3') then
		SIGNAL SQLSTATE '23000'
					SET MESSAGE_TEXT = 'Invalid access level';
	end if;
	
	if new.access_level = 'L3' and (not old.access_level = "L3") then
	
		IF EXISTS(SELECT * FROM job_title WHERE access_level = 'L3') THEN
			SIGNAL SQLSTATE '23000'
						SET MESSAGE_TEXT = 'Multiple job titles with L3 access_level ';
		end if;
		
		if not new.job_title = "Human Resources Manager" then 
			SIGNAL SQLSTATE '23000'
						SET MESSAGE_TEXT = 'L3 level job title should be Human Resources Manager';
		
		end if;
	
	end if;	
	
	
	
	if new.access_level = 'L3' and  old.access_level = "L3" then
	
		
		
		if not new.job_title = "Human Resources Manager" then 
			SIGNAL SQLSTATE '23000'
						SET MESSAGE_TEXT = 'L3 level job title should be Human Resources Manager';
		
		end if;
	
	end if;
	
    	
END $$

DELIMITER ;



DELIMITER $$

CREATE OR REPLACE TRIGGER before_insert_leave BEFORE INSERT
ON `leave`
FOR EACH ROW
BEGIN

	SELECT pay_grade into @pay_grade from employee where employee_id = NEW.employee_id;


	IF  not exists(select * from `pay_grade_leave` where `pay_grade` = @pay_grade and `leave_type` = NEW.leave_type) THEN
		SIGNAL SQLSTATE '23000'
                SET MESSAGE_TEXT = 'Invalid leave_type';
	END IF;
	
	If not year(new.date) =  year(current_date()) then
		SIGNAL SQLSTATE '23000'
                SET MESSAGE_TEXT = 'Leave application is permitted for only current year';
	end if;
	
	if datediff(new.date,current_date()) <=0 then
		SIGNAL SQLSTATE '23000'
                SET MESSAGE_TEXT = 'Leave application is permitted only for future dates';
	end if;
	
	SELECT  count(*) into @taken_count from `leave` where employee_id = NEW.employee_id and leave_type = NEW.leave_type and state="approved" AND (date BETWEEN DATE(CONCAT(YEAR(CURRENT_DATE()),"-01-01"))  AND DATE(CONCAT(YEAR(CURRENT_DATE()),"-12-31")));
	SELECT `limit` into @leave_limit from pay_grade_leave where pay_grade=@pay_grade and leave_type=NEW.leave_type;
	
	IF @taken_count >= @leave_limit THEN
		SIGNAL SQLSTATE '23000'
                SET MESSAGE_TEXT = 'Exceeds Leave Limit';
	END IF;
	
	
	
	
    	
END $$

DELIMITER ; 



DELIMITER $$

CREATE OR REPLACE TRIGGER check_active_employee_for_user BEFORE INSERT
ON `user`
FOR EACH ROW
BEGIN
	
	
	
	IF not exists(select * from `employee` where `employee_id` = NEW.employee_id and `active_status` = 1) THEN
		SIGNAL SQLSTATE '23000'
                SET MESSAGE_TEXT = 'Employee is not active';
	END IF;
	
	
    	
END $$

DELIMITER ;



DELIMITER $$

CREATE OR REPLACE TRIGGER restrict_delete BEFORE DELETE
ON organization_info
FOR EACH ROW
BEGIN
	IF OLD.key in ('Name','Contact No.','Address Line 1','Address Line 2','Address Line 2','Reg No.') THEN
    	SIGNAL SQLSTATE 'HY000'
             SET MESSAGE_TEXT = 'Essential keys are not permitted to delete';
	END IF;
    
END $$

DELIMITER ;



DELIMITER $$

CREATE OR REPLACE TRIGGER leave_type_before_update BEFORE UPDATE
ON leave_type
FOR EACH ROW
BEGIN	
	
	if old.leave_type = 'No-Pay' then
		SIGNAL SQLSTATE '23000'
						SET MESSAGE_TEXT = 'No-Pay leave type can not be changed';
	
	end if;
	
	
    	
END $$

DELIMITER ;




