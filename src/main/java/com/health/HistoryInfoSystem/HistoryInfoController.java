package com.health.HistoryInfoSystem;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDate;
import java.util.Objects;

public class HistoryInfoController {
    private HistoryInfoDAO historyInfoDAO;
    public HistoryInfoController(){
        historyInfoDAO =new HistoryInfoDAO();
    }

    public DeptAdmin deptAdminLogin(HttpServletRequest request){
        return historyInfoDAO.deptAdminLogin(createDeptAdminFromLoginRequest(request));
    }
    public Admin adminLogin(HttpServletRequest request){
        return historyInfoDAO.adminLogin(createAdminFromLoginRequest(request));
    }
    public Doctor doctorLogin(HttpServletRequest request){
        return historyInfoDAO.doctorLogin(createDoctorFromLoginRequest(request));
    }
    public Patient patientLogin(HttpServletRequest request){
        return historyInfoDAO.patientLogin(createPatientFromLoginRequest(request));
    }
    public Integer addDoctor (HttpServletRequest request){
        return historyInfoDAO.addDoctor(createDoctorFromRequest(request));
    }
    public Integer deleteDoctor (HttpServletRequest request){
        return historyInfoDAO.deleteDoctor(createDoctorFromRequest(request));
    }
    public Doctor[] getDeptDoctors(HttpServletRequest request){
        return historyInfoDAO.viewDeptDoctors((DeptAdmin) request.getAttribute("deptAdmin"));
    }
    public Visit[] getVisitsLog(HttpServletRequest request){
        Patient patient=createPatientFromRequest(request);
        patient.setPatientId(historyInfoDAO.getPatientId(patient.getName()));
        return historyInfoDAO.viewVisitLog(patient);
    }
    public Patient[] getPatients(HttpServletRequest request){
        Doctor doctor= createDoctorFromDoctorRequest(request);
        return historyInfoDAO.viewPatients(doctor);
    }
    public Integer addPatient(HttpServletRequest request){
        Patient patient=createPatientFromRequest(request);
        return historyInfoDAO.addPatient(patient);
    }
    public Integer addVisit(HttpServletRequest request){
        Visit visit=createVisitFromRequest(request);
        return historyInfoDAO.addVisit(visit);
    }
    public Integer addDepartment (HttpServletRequest request){
        Department department=new Department();
        department.setName(request.getParameter("departmentName"));
        return historyInfoDAO.addDepartment(department);
    }
    public Integer deleteDepartment (HttpServletRequest request){
        Department department=new Department();
        department.setDepartmentId(Integer.parseInt(request.getParameter("departmentId")));
        return historyInfoDAO.deleteDepartment(department);
    }
    public Integer addDeptAdmin(HttpServletRequest request){
        return historyInfoDAO.addDeptAdmin(createDeptAdminFromRequest(request));
    }
    public Integer deleteDeptAdmin(HttpServletRequest request){
        return historyInfoDAO.deleteDeptAdmin(createDeptAdminFromRequest(request));
    }
    public Department[] getDepartments(HttpServletRequest request){
        return historyInfoDAO.viewDepartments();
    }
    public DeptAdmin[] getDeptAdmins(HttpServletRequest request){
        return historyInfoDAO.viewDeptAdmins();
    }
    public Integer blockDoctor(HttpServletRequest request){
        Doctor doctor=new Doctor();
        doctor.setDoctorId(Integer.parseInt(request.getParameter("doctorId")));
        doctor.setBlocked(request.getParameter("isBlocked").equals("on"));
        return historyInfoDAO.blockDoctor(doctor);
    }
    private DeptAdmin createDeptAdminFromLoginRequest(HttpServletRequest request){
        DeptAdmin deptAdmin =new DeptAdmin();
        deptAdmin.setUsername(request.getParameter("username"));
        deptAdmin.setPassword(Integer.toString(request.getParameter("password").hashCode()));
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
        deptAdmin.setPassword(Integer.toString(request.getParameter("password").hashCode()));
        return deptAdmin;
    }
    private Admin createAdminFromLoginRequest(HttpServletRequest request){
        Admin admin=new Admin();
        admin.setUsername(request.getParameter("username"));
        admin.setPassword(Integer.toString(request.getParameter("password").hashCode()));
        return admin;
    }
    private Doctor createDoctorFromLoginRequest(HttpServletRequest request){
        Doctor doctor=new Doctor();
        doctor.setUsername(request.getParameter("username"));
        doctor.setPassword(Integer.toString(request.getParameter("password").hashCode()));
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
        doctor.setPassword(Integer.toString(request.getParameter("password").hashCode()));
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
        visit.setPatientId(historyInfoDAO.getPatientId(request.getParameter("patientName")));
        visit.setDate(LocalDate.parse(request.getParameter("date")));
        visit.setReason(request.getParameter("reason"));
        visit.setPrescription((String) request.getAttribute("prescription"));
        visit.setTest((String) request.getAttribute("test"));
        visit.setNotes(request.getParameter("notes"));
        return visit;
    }
}
