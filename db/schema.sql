DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS manager;
DROP TABLE IF EXISTS comp_position;
DROP TABLE IF EXISTS comp_department;
CREATE TABLE comp_department(
  id int NOT NULL PRIMARY KEY  AUTO_INCREMENT,
  comp_department varchar(30) NOT NULL UNIQUE
);
CREATE TABLE comp_position (
  id int NOT NULL PRIMARY KEY  AUTO_INCREMENT,
  title VARCHAR(30) NOT NULL UNIQUE,
  salary DECIMAL NOT NULL,
  department_desc VARCHAR(30) NOT NULL,
  CONSTRAINT fk_comp_department FOREIGN KEY (department_desc) REFERENCES comp_department(comp_department)
);
CREATE TABLE manager (
  id INT PRIMARY KEY AUTO_INCREMENT,
  manager_name VARCHAR(30) NOT NULL UNIQUE,
  department_desc VARCHAR(30) NOT NULL,
  CONSTRAINT fk_department_manger FOREIGN KEY (department_desc) REFERENCES comp_department(comp_department)
);
CREATE TABLE employee (
  id INT PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  comp_pos_name VARCHAR(30) NOT NULL,
  manager_name VARCHAR (30),
  CONSTRAINT fk_comp_position FOREIGN KEY (comp_pos_name) REFERENCES comp_position(title),
  CONSTRAINT fk_manager_name FOREIGN KEY (manager_name) REFERENCES manager(manager_name)
);