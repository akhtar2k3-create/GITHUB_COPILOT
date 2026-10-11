# PL/SQL Procedures - Employee Management

This repository contains PL/SQL procedures practiced using Oracle Database and VS Code.

## 📋 Procedures Implemented

1. **GET_HIGHEST_SALARY** - Returns the maximum salary from employees table
2. **GET_EMPLOYEE_COUNT** - Returns total count of employees
3. **GET_EMPLOYEES_WITH_R** - Uses REF CURSOR to get employees whose name contains 'R'
4. **GET_DEPT_SALARY** - Returns total salary for a given department ID

## 🛠️ Tech Stack
- Oracle Database 21c
- PL/SQL
- VS Code with Oracle Developer Tools

## ✅ Status
All 4 procedures compiled and tested successfully - Oct 11, 2026

## How to Run
```sql
SET SERVEROUTPUT ON;
EXEC get_highest_salary(:sal);