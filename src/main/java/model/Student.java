package model;

import java.util.Date;

public class Student implements Comparable<Student> {
    private int id;
    private String name;
    private int gender;
    private String dob;
    private String mail;
    private String address;
    private String phoneNum;
    private int status;
    private String image;

    public Student() {

    }

    public Student(int id, String name, int gender, String dob, String mail, String address, String phoneNum, int status) {
        this.id = id;
        this.name = name;
        this.gender = gender;
        this.dob = dob;
        this.mail = mail;
        this.address = address;
        this.phoneNum = phoneNum;
        this.status = status;
    }

    public Student(String name, int gender, String dob, String mail, String address, String phoneNum, int status) {
        this.name = name;
        this.gender = gender;
        this.dob = dob;
        this.mail = mail;
        this.address = address;
        this.phoneNum = phoneNum;
        this.status = status;
    }

    public Student(int id, String name, int gender, String dob, String mail, String address, String phoneNum, String image) {
        this.id = id;
        this.name = name;
        this.gender = gender;
        this.dob = dob;
        this.mail = mail;
        this.address = address;
        this.phoneNum = phoneNum;
        this.image = image;
    }

    public Student(String name, int gender, String dob, String mail, String address, String phoneNum, String image) {
        this.name = name;
        this.gender = gender;
        this.dob = dob;
        this.mail = mail;
        this.address = address;
        this.phoneNum = phoneNum;
        this.image = image;
    }

    public Student(int id, String name, int gender, String dob, String mail, String address, String phoneNum, int status, String image) {
        this.id = id;
        this.name = name;
        this.gender = gender;
        this.dob = dob;
        this.mail = mail;
        this.address = address;
        this.phoneNum = phoneNum;
        this.status = status;
        this.image = image;
    }

    public Student(String name, int gender, String dob, String mail, String address, String phoneNum, int status, String image) {
        this.name = name;
        this.gender = gender;
        this.dob = dob;
        this.mail = mail;
        this.address = address;
        this.phoneNum = phoneNum;
        this.status = status;
        this.image = image;
    }

    public Student(int id, String name, int gender, String dob, String address, String phoneNum) {
        this.id = id;
        this.name = name;
        this.gender = gender;
        this.dob = dob;
        this.address = address;
        this.phoneNum = phoneNum;
    }

    public Student(String name, int gender, String dob, String address, String phoneNum) {
        this.name = name;
        this.gender = gender;
        this.dob = dob;
        this.address = address;
        this.phoneNum = phoneNum;
    }

    public Student(int id, String name, int gender, String dob, String mail, String address, String phoneNum) {
        this.id = id;
        this.name = name;
        this.gender = gender;
        this.dob = dob;
        this.mail = mail;
        this.address = address;
        this.phoneNum = phoneNum;
    }

    public Student(String name, int gender, String dob, String mail, String address, String phoneNum) {
        this.name = name;
        this.gender = gender;
        this.dob = dob;
        this.mail = mail;
        this.address = address;
        this.phoneNum = phoneNum;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public int compareTo(Student student) {
        return (int)(this.id - student.getId());
    }
}
