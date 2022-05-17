package com.health.HistoryInfoSystem;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDate;
import java.util.Objects;

public class LoggingController {
    private LoggingDAO loggingDAO;
    public LoggingController(){
        loggingDAO=new LoggingDAO();
    }

    public DeptAdmin deptAdminLogin(HttpServletRequest request){
        return loggingDAO.deptAdminLogin(createDeptAdminFromLoginRequest(request));
    }
    public Admin adminLogin(HttpServletRequest request){
        return loggingDAO.adminLogin(createAdminFromLoginRequest(request));
    }
    public Doctor doctorLogin(HttpServletRequest request){
        return loggingDAO.doctorLogin(createDoctorFromLoginRequest(request));
    }
    public Patient patientLogin(HttpServletRequest request){
        return loggingDAO.patientLogin(createPatientFromLoginRequest(request));
    }
    public Integer addDoctor (HttpServletRequest request){
        return loggingDAO.addDoctor(createDoctorFromRequest(request));
    }
    public Integer deleteDoctor (HttpServletRequest request){
        return loggingDAO.deleteDoctor(createDoctorFromRequest(request));
    }
    public Doctor[] getDeptDoctors(HttpServletRequest request){
        return loggingDAO.viewDeptDoctors((DeptAdmin) request.getAttribute("deptAdmin"));
    }
    public Visit[] getVisitsLog(HttpServletRequest request){
        Patient patient=createPatientFromRequest(request);
        patient.setPatientId(loggingDAO.getPatientId(patient.getName()));
        return loggingDAO.viewVisitLog(patient);
    }
    public Patient[] getPatients(HttpServletRequest request){
        Doctor doctor= createDoctorFromDoctorRequest(request);
        return loggingDAO.viewPatients(doctor);
    }
    public Integer addPatient(HttpServletRequest request){
        Patient patient=createPatientFromRequest(request);
        return loggingDAO.addPatient(patient);
    }
    public Integer addVisit(HttpServletRequest request){
        Visit visit=createVisitFromRequest(request);
        return loggingDAO.addVisit(visit);
    }
    public Integer addDepartment (HttpServletRequest request){
        Department department=new Department();
        department.setName(request.getParameter("departmentName"));
        return loggingDAO.addDepartment(department);
    }
    public Integer deleteDepartment (HttpServletRequest request){
        Department department=new Department();
        department.setDepartmentId(Integer.parseInt(request.getParameter("departmentId")));
        return loggingDAO.deleteDepartment(department);
    }
    public Integer addDeptAdmin(HttpServletRequest request){
        return loggingDAO.addDeptAdmin(createDeptAdminFromRequest(request));
    }
    public Integer deleteDeptAdmin(HttpServletRequest request){
        return loggingDAO.deleteDeptAdmin(createDeptAdminFromRequest(request));
    }
    public Department[] getDepartments(HttpServletRequest request){
        return loggingDAO.viewDepartments();
    }
    public DeptAdmin[] getDeptAdmins(HttpServletRequest request){
        return loggingDAO.viewDeptAdmins();
    }
    private DeptAdmin createDeptAdminFromLoginRequest(HttpServletRequest request){
        DeptAdmin deptAdmin =new DeptAdmin();
        deptAdmin.setUsername(request.getParameter("username"));
        deptAdmin.setPassword(request.getParameter("password"));
        return deptAdmin;
    }
    private DeptAdmin createDeptAdminFromRequest(HttpServletRequest request){
        DeptAdmin deptAdmin =new DeptAdmin();
        if(!request.getParameter("deptAdminId").equals(""))
            deptAdmin.setAdminId(Integer.parseInt(request.getParameter("deptAdminId")));
        deptAdmin.setName(request.getParameter("name"));
        if(!request.getParameter("deptId").equals(""))
            deptAdmin.setDepartmentId(Integer.parseInt(request.getParameter("deptId")));
        else{
            deptAdmin.setDepartmentName(request.getParameter("deptName"));
            for(Department department:getDepartments(request))
                if(department.getName().equals(deptAdmin.getDepartmentName())) {
                    deptAdmin.setDepartmentId(department.getDepartmentId());
                    break;
                }
        }
        deptAdmin.setUsername(request.getParameter("username"));
        deptAdmin.setPassword(request.getParameter("password"));
        return deptAdmin;
    }
    private Admin createAdminFromLoginRequest(HttpServletRequest request){
        Admin admin=new Admin();
        admin.setUsername(request.getParameter("username"));
        admin.setPassword(request.getParameter("password"));
        return admin;
    }
    private Doctor createDoctorFromLoginRequest(HttpServletRequest request){
        Doctor doctor=new Doctor();
        doctor.setUsername(request.getParameter("username"));
        doctor.setPassword(request.getParameter("password"));
        return doctor;
    }
    private Doctor createDoctorFromDoctorRequest(HttpServletRequest request){
        Doctor doctor=new Doctor();
        doctor.setDoctorId(Integer.parseInt(request.getParameter("doctorId")));
        return doctor;
    }
    private Doctor createDoctorFromRequest(HttpServletRequest request){
        Doctor doctor=new Doctor();
        if(!request.getParameter("doctorId").equals(""))
            doctor.setDoctorId(Integer.parseInt(request.getParameter("doctorId")));
        doctor.setName(request.getParameter("name"));
        doctor.setDepartmentId(Integer.parseInt(request.getParameter("departmentId")));
        doctor.setSpecialty(request.getParameter("specialty"));
        doctor.setUsername(request.getParameter("username"));
        doctor.setPassword(request.getParameter("password"));
        return doctor;
    }
    private Patient createPatientFromLoginRequest(HttpServletRequest request){
        Patient patient=new Patient();
        patient.setName(request.getParameter("name"));
        patient.setSsn(request.getParameter("ssn"));
        return patient;
    }
    private Patient createPatientFromRequest(HttpServletRequest request){
        Patient patient=new Patient();
        patient.setName(request.getParameter("name"));
        if (!Objects.isNull(request.getParameter("dateOfBirth"))){
            patient.setDateOfBirth(LocalDate.parse(request.getParameter("dateOfBirth")));
            patient.setNumber(request.getParameter("number"));
        }
        patient.setSsn(request.getParameter("ssn"));
        return patient;
    }
    private Visit createVisitFromRequest(HttpServletRequest request){
        Visit visit=new Visit();
        visit.setDoctorId(((Doctor)request.getSession().getAttribute("doctor")).getDoctorId());
        visit.setPatientId(loggingDAO.getPatientId(request.getParameter("patientName")));
        visit.setDate(LocalDate.parse(request.getParameter("date")));
        visit.setReason(request.getParameter("reason"));
        visit.setPrescription((String) request.getAttribute("prescription"));
        visit.setTest((String) request.getAttribute("test"));
        visit.setNotes(request.getParameter("notes"));
        return visit;
    }
}
