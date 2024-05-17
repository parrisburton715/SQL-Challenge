-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/UhAAYH
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Departments" (
    "department_num" VARCHAR   NOT NULL,
    "department_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "department_num"
     )
);

CREATE TABLE "Department_Employee" (
    "employee_num" PK,   NOT NULL,
    "department_num" VARCHAR   NOT NULL
);

CREATE TABLE "Department_Manager" (
    "department_num" PK,   NOT NULL,
    "employee_num" Int   NOT NULL
);

CREATE TABLE "Employees" (
    "employee_num" INT   NOT NULL,
    "employee_title_id" VARCHAR   NOT NULL,
    "birth_date" Date   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" Char   NOT NULL,
    "hire_date" Date   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "employee_num"
     )
);

CREATE TABLE "Salaries" (
    "employee_num" Int   NOT NULL,
    "salary" Int   NOT NULL
);

CREATE TABLE "Title" (
    "employee_title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Title" PRIMARY KEY (
        "employee_title_id"
     )
);

ALTER TABLE "Department_Employee" ADD CONSTRAINT "fk_Department_Employee__employee_num" FOREIGN KEY("", "employee_num")
REFERENCES "Department_Manager" ("", "employee_num");

ALTER TABLE "Department_Employee" ADD CONSTRAINT "fk_Department_Employee_department_num" FOREIGN KEY("department_num")
REFERENCES "Departments" ("department_num");

ALTER TABLE "Department_Manager" ADD CONSTRAINT "fk_Department_Manager_department_num" FOREIGN KEY("department_num")
REFERENCES "Department_Employee" ("department_num");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_employee_title_id" FOREIGN KEY("employee_title_id")
REFERENCES "Title" ("employee_title_id");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_employee_num" FOREIGN KEY("employee_num")
REFERENCES "Employees" ("employee_num");

