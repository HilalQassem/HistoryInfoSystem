package com.health.HistoryInfoSystem;

import java.sql.*;
import java.time.LocalDate;

public class HistoryInfoDAO {
    private Connection connection;

    public HistoryInfoDAO(){
        String hostUrl = "jdbc:mysql://localhost:3306/";
        String databaseName = "historyinfosystem";
        String driverClass = "com.mysql.cj.jdbc.Driver";
        String username = "root";
        String password = "";
        try {
            Class.forName(driverClass).getDeclaredConstructor().newInstance();
            connection = DriverManager.getConnection(hostUrl + databaseName, username, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public DeptAdmin deptAdminLogin(DeptAdmin deptAdmin){
        try {
            String deptAdminLoginQuery="SELECT * FROM dept_admin WHERE username=? AND password=?;";
            PreparedStatement preparedStatement = connection.prepareStatement(deptAdminLoginQuery);
            preparedStatement.setString(1, deptAdmin.getUsername());
            preparedStatement.setString(2, deptAdmin.getPassword());
            ResultSet resultSet = preparedStatement.executeQuery();
            deptAdmin =createDeptAdminFromResultSet(resultSet);
        }catch (Exception e){
            e.printStackTrace();
        }
        return deptAdmin;
    }
    public Admin adminLogin(Admin admin){
        try {
            String adminLoginQuery="SELECT * FROM admin WHERE username=? AND password=?;";
            PreparedStatement preparedStatement = connection.prepareStatement(adminLoginQuery);
            preparedStatement.setString(1,admin.getUsername());
            preparedStatement.setString(2,admin.getPassword());
            ResultSet resultSet = preparedStatement.executeQuery();
            admin=createAdminFromResultSet(resultSet);
        }catch (Exception e){
            e.printStackTrace();
        }
        return admin;
    }
    public Doctor doctorLogin(Doctor doctor){
        try {
            String doctorLoginQuery="SELECT * FROM doctor WHERE username=? AND password=?;";
            PreparedStatement preparedStatement = connection.prepareStatement(doctorLoginQuery);
            preparedStatement.setString(1,doctor.getUsername());
            preparedStatement.setString(2,doctor.getPassword());
            ResultSet resultSet = preparedStatement.executeQuery();
            doctor=createDoctorFromResultSet(resultSet);
        }catch (Exception e){
            e.printStackTrace();
        }
        return doctor;
    }
    public Patient patientLogin(Patient patient){
        try {
            String adminLoginQuery="SELECT * FROM patient WHERE name=? AND ssn=?;";
            PreparedStatement preparedStatement = connection.prepareStatement(adminLoginQuery);
            preparedStatement.setString(1, patient.getName());
            preparedStatement.setString(2,patient.getSsn());
            ResultSet resultSet = preparedStatement.executeQuery();
            patient=createPatientFromResultSet(resultSet);
        }catch (Exception e){
            e.printStackTrace();
        }
        return patient;
    }
    public Integer addDepartment(Department newDepartment){
        Integer status=0;
            if (!newDepartment.getName().matches("")){
                try {
                    String addDepartmentQuery="INSERT INTO department (name) VALUE (?);";
                    PreparedStatement preparedStatement=connection.prepareStatement(addDepartmentQuery);
                    preparedStatement.setString(1,newDepartment.getName());
                    status=preparedStatement.executeUpdate();
                }catch (Exception e){
                    e.printStackTrace();
                }
            }
        return status;
    }
    public Integer deleteDepartment(Department oldDepartment){
        Integer status=0;
        try {
            String deleteDepartmentQuery="DELETE FROM department WHERE departmentId=?;";
            PreparedStatement preparedStatement=connection.prepareStatement(deleteDepartmentQuery);
            preparedStatement.setInt(1,oldDepartment.getDepartmentId());
            status=preparedStatement.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
        return status;
    }
    public Integer addDeptAdmin(DeptAdmin newAdmin){
        Integer status=0;
        try {
            String addAdminQuery="INSERT INTO dept_admin (name,departmentId,username,password)" +
                    "VALUES (?,?,?,?);";
            PreparedStatement preparedStatement=connection.prepareStatement(addAdminQuery);
            preparedStatement.setString(1,newAdmin.getName());
            preparedStatement.setInt(2,newAdmin.getDepartmentId());
            preparedStatement.setString(3,newAdmin.getUsername());
            preparedStatement.setString(4,newAdmin.getPassword());
            status=preparedStatement.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
        return status;
    }
    public Integer deleteDeptAdmin(DeptAdmin oldAdmin){
        Integer status=0;
        try {
            String deleteAdminQuery="DELETE FROM dept_admin WHERE adminId=? AND name=?;";
            PreparedStatement preparedStatement=connection.prepareStatement(deleteAdminQuery);
            preparedStatement.setInt(1,oldAdmin.getAdminId());
            preparedStatement.setString(2,oldAdmin.getName());
            status=preparedStatement.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
        return status;
    }
    public Doctor[] viewDeptDoctors (DeptAdmin deptAdmin){
        Doctor[] doctorsFound=new Doctor[0];
        Integer[] idOfDoctorsFound;
        try {
            String findDoctorsIdQuery = "SELECT DISTINCT doctorId,count(doctorId) over () numberOfDoctorsFound FROM doctor" +
                    " WHERE departmentId=? GROUP BY doctorId;";
            PreparedStatement preparedStatement=connection.prepareStatement(findDoctorsIdQuery);
            preparedStatement.setInt(1,deptAdmin.getDepartmentId());
            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.next();
            idOfDoctorsFound=new Integer[resultSet.getInt("numberOfDoctorsFound")];
            for(int i=0;i<idOfDoctorsFound.length;i++){
                idOfDoctorsFound[i]=resultSet.getInt("doctorId");
                resultSet.next();
            }
            doctorsFound=new Doctor[idOfDoctorsFound.length];
            for(int i=0;i<doctorsFound.length;i++){
                String getDoctorsQuery = "SELECT * FROM doctor WHERE doctorId=?;";
                preparedStatement=connection.prepareStatement(getDoctorsQuery);
                preparedStatement.setInt(1,idOfDoctorsFound[i]);
                resultSet = preparedStatement.executeQuery();
                doctorsFound[i]=createDoctorFromResultSet(resultSet);
            }
        } catch (Exception exception) {
            exception.printStackTrace();
        }
        return doctorsFound;
    }
    public Integer addDoctor(Doctor newDoctor){
        Integer status=0;
        try {
            String addDoctorQuery="INSERT INTO doctor (name,specialty,departmentId,username,password)" +
                    "VALUES (?,?,?,?,?);";
            PreparedStatement preparedStatement=connection.prepareStatement(addDoctorQuery);
            preparedStatement.setString(1,newDoctor.getName());
            preparedStatement.setString(2,newDoctor.getSpecialty());
            preparedStatement.setInt(3,newDoctor.getDepartmentId());
            preparedStatement.setString(4,newDoctor.getUsername());
            preparedStatement.setString(5,newDoctor.getPassword());
            status=preparedStatement.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
        return status;
    }
    public Integer deleteDoctor(Doctor oldDoctor){
        Integer status=0;
        try {
            String deleteDoctorQuery="DELETE FROM doctor WHERE doctorId=?";
            PreparedStatement preparedStatement=connection.prepareStatement(deleteDoctorQuery);
            preparedStatement.setInt(1,oldDoctor.getDoctorId());
            status=preparedStatement.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
        return status;
    }
    public Patient[] viewPatients(Doctor doctor){
        Integer[] idOfPatientsFound;
        Patient[] patientsFound=new Patient[0];
        try {
            String findPatientsIdQuery = "SELECT DISTINCT patientId,count(patientId) over () numberOfPatientsFound FROM visit" +
                    " WHERE doctorId=? GROUP BY patientId;";
            PreparedStatement preparedStatement=connection.prepareStatement(findPatientsIdQuery);
            preparedStatement.setInt(1,doctor.getDoctorId());
            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.next();
            idOfPatientsFound=new Integer[resultSet.getInt("numberOfPatientsFound")];
            for(int i=0;i<idOfPatientsFound.length;i++){
                idOfPatientsFound[i]=resultSet.getInt("patientId");
                resultSet.next();
            }
            patientsFound=new Patient[idOfPatientsFound.length];
            for(int i=0;i<patientsFound.length;i++){
                String findPatientsQuery = "SELECT * FROM patient WHERE patientId=?;";
                preparedStatement=connection.prepareStatement(findPatientsQuery);
                preparedStatement.setInt(1,idOfPatientsFound[i]);
                resultSet = preparedStatement.executeQuery();
                patientsFound[i]=createPatientFromResultSet(resultSet);
            }
        } catch (Exception exception) {
            exception.printStackTrace();
        }
        return patientsFound;
    }
    public Visit[] viewVisitLog(Patient patient){
        Visit[] visitLog=new Visit[0];
        try {
            String findVisitsQuery = "SELECT *,count(*) over () numberOfVisitsFound FROM visit WHERE patientId=?;";
            PreparedStatement preparedStatement=connection.prepareStatement(findVisitsQuery,ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            preparedStatement.setInt(1,patient.getPatientId());
            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.next();
            visitLog=new Visit[resultSet.getInt("numberOfVisitsFound")];
            resultSet.previous();
            for(int i=0;i<visitLog.length;i++){
                visitLog[i]=createVisitFromResultSet(resultSet);
            }
        } catch (Exception exception) {
            exception.printStackTrace();
            visitLog=null;
        }
        return visitLog;
    }
    public Department[] viewDepartments(){
        Department[] departments=new Department[0];
        try {
            String findDepartmentsQuery = "SELECT *,count(*) over () numberOfDepartmentsFound FROM department;";
            PreparedStatement preparedStatement=connection.prepareStatement(findDepartmentsQuery,ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.next();
            departments=new Department[resultSet.getInt("numberOfDepartmentsFound")];
            resultSet.previous();
            for(int i=0;i<departments.length;i++){
                departments[i]=createDepartmentFromResultSet(resultSet);
            }
        } catch (Exception exception) {
            exception.printStackTrace();
        }
        return departments;
    }
    public DeptAdmin[] viewDeptAdmins(){
        DeptAdmin[] deptAdmins=new DeptAdmin[0];
        try {
            String findDeptAdminsQuery = "SELECT *,count(*) over () numberOfDeptAdminsFound FROM dept_admin;";
            PreparedStatement preparedStatement=connection.prepareStatement(findDeptAdminsQuery,ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.next();
            deptAdmins=new DeptAdmin[resultSet.getInt("numberOfDeptAdminsFound")];
            resultSet.previous();
            for(int i=0;i<deptAdmins.length;i++){
                deptAdmins[i]=createDeptAdminFromResultSet(resultSet);
            }
        } catch (Exception exception) {
            exception.printStackTrace();
        }
        return deptAdmins;
    }
    public Integer addPatient(Patient newPatient){
        Integer status=0;
        try {
            String addAdminQuery="INSERT INTO patient (name,dateOfBirth,number,joinDate,ssn)" +
                    "VALUES (?,?,?,?,?);";
            PreparedStatement preparedStatement=connection.prepareStatement(addAdminQuery);
            preparedStatement.setString(1,newPatient.getName());
            preparedStatement.setDate(2, Date.valueOf(newPatient.getDateOfBirth()));
            preparedStatement.setString(3, newPatient.getNumber());
            preparedStatement.setDate(4, Date.valueOf(LocalDate.now()));
            preparedStatement.setString(5,newPatient.getSsn());
            status=preparedStatement.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
        return status;
    }
    public Integer addVisit(Visit visit){
        Integer status=0;
        try {
            String addAdminQuery="INSERT INTO visit (doctorId,patientId,date,reason,prescription,test,notes)" +
                    "VALUES (?,?,?,?,?,?,?);";
            PreparedStatement preparedStatement=connection.prepareStatement(addAdminQuery);
            preparedStatement.setInt(1,visit.getDoctorId());
            preparedStatement.setInt(2,visit.getPatientId());
            preparedStatement.setDate(3, Date.valueOf(visit.getDate()));
            preparedStatement.setString(4, visit.getReason());
            preparedStatement.setString(5, visit.getPrescription());
            preparedStatement.setString(6, visit.getTest());
            preparedStatement.setString(7, visit.getNotes());
            status=preparedStatement.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
        return status;
    }
    private DeptAdmin createDeptAdminFromResultSet(ResultSet resultSet) throws Exception{
        DeptAdmin deptAdmin =null;
        if (resultSet.next()){
            deptAdmin =new DeptAdmin();
            deptAdmin.setAdminId(resultSet.getInt("adminId"));
            deptAdmin.setName(resultSet.getString("name"));
            deptAdmin.setDepartmentId(resultSet.getInt("departmentId"));
            deptAdmin.setUsername(resultSet.getString("username"));
            deptAdmin.setPassword(resultSet.getString("password"));
        }
        return deptAdmin;
    }
    private Admin createAdminFromResultSet(ResultSet resultSet) throws Exception{
        Admin admin=null;
        if (resultSet.next()){
            admin=new Admin();
            admin.setAdminId(resultSet.getInt("adminId"));
            admin.setName(resultSet.getString("name"));
            admin.setUsername(resultSet.getString("username"));
            admin.setPassword(resultSet.getString("password"));
        }
        return admin;
    }
    private Doctor createDoctorFromResultSet(ResultSet resultSet) throws Exception{
        Doctor doctor=null;
        if (resultSet.next()){
            doctor=new Doctor();
            doctor.setDoctorId(resultSet.getInt("doctorId"));
            doctor.setName(resultSet.getString("name"));
            doctor.setSpecialty(resultSet.getString("specialty"));
            doctor.setDepartmentId(resultSet.getInt("departmentId"));
            doctor.setUsername(resultSet.getString("username"));
            doctor.setPassword(resultSet.getString("password"));
        }
        return doctor;
    }
    private Patient createPatientFromResultSet(ResultSet resultSet) throws Exception{
        Patient patient=null;
        if (resultSet.next()){
            patient=new Patient();
            patient.setPatientId(resultSet.getInt("patientId"));
            patient.setName(resultSet.getString("name"));
            patient.setDateOfBirth(resultSet.getDate("dateOfBirth").toLocalDate());
            patient.setNumber(resultSet.getString("number"));
            patient.setJoinDate(resultSet.getDate("joinDate").toLocalDate());
            patient.setSsn(resultSet.getString("ssn"));
        }
        return patient;
    }
    private Visit createVisitFromResultSet(ResultSet resultSet) throws Exception{
        Visit visit=null;
        if(resultSet.next()){
            visit=new Visit();
            visit.setVisitId(resultSet.getInt("visitId"));
            visit.setDoctorId(resultSet.getInt("doctorId"));
            visit.setDoctorName(getDoctorName(visit.getDoctorId()));
            visit.setPatientId(resultSet.getInt("patientId"));
            visit.setPatientName(getPatientName(visit.getPatientId()));
            visit.setDate(resultSet.getDate("date").toLocalDate());
            visit.setReason(resultSet.getString("reason"));
            visit.setPrescription(resultSet.getString("prescription"));
            visit.setTest(resultSet.getString("test"));
            visit.setNotes(resultSet.getString("notes"));
        }
        return visit;
    }
    private String getDoctorName(Integer doctorId){
        String name="";
        try {
            String getDoctorNameQuery = "SELECT name FROM doctor WHERE doctorId=?;";
            PreparedStatement preparedStatement=connection.prepareStatement(getDoctorNameQuery);
            preparedStatement.setInt(1,doctorId);
            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.next();
            name=resultSet.getString("name");
        } catch (Exception exception) {
            exception.printStackTrace();
        }
        return name;
    }
    private String getPatientName(Integer patientId){
        String name="";
        try {
            String getPatientNameQuery = "SELECT name FROM patient WHERE patientId=?;";
            PreparedStatement preparedStatement=connection.prepareStatement(getPatientNameQuery);
            preparedStatement.setInt(1,patientId);
            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.next();
            name=resultSet.getString("name");
        } catch (Exception exception) {
            exception.printStackTrace();
        }
        return name;
    }
    private Department createDepartmentFromResultSet(ResultSet resultSet) throws Exception{
        Department department=null;
        if(resultSet.next()){
            department=new Department();
            department.setDepartmentId(resultSet.getInt("departmentId"));
            department.setName(resultSet.getString("name"));
        }
        return department;
    }
    public Integer getPatientId(String patientName){
        Integer patientId=0;
        try {
            String getPatientIdQuery = "SELECT patientId FROM patient WHERE name=?;";
            PreparedStatement preparedStatement=connection.prepareStatement(getPatientIdQuery);
            preparedStatement.setString(1,patientName);
            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.next();
            patientId=resultSet.getInt("patientId");
        } catch (Exception exception) {
            exception.printStackTrace();
        }
        return patientId;
    }
}
