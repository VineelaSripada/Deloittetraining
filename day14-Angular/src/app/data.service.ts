import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import {Student} from './models/student.models'

@Injectable({
  providedIn: 'root'
})
export class DataService {

  
  public url:string = "https://localhost:7259/api/StudentsApi";

  constructor(private httpObj:HttpClient){
 }
 

  getAllStudents():Observable<Student[]>
 {
   return  this.httpObj.get<Student[]>(this.url);
 }

 public getStudentById(id:number):Observable<Student>
 {
   return  this.httpObj.get<Student>(this.url + "/" +  id);
 }

 public addStudent(obj:Student):Observable<string>
 {
   return this.httpObj.post<string>(this.url, obj);
 }

 public updateStudent(obj:Student):Observable<string>
 {
   return this.httpObj.put<string>(this.url, obj);
 }

 public deleteStudentById(id:number):Observable<string>
 {
   return  this.httpObj.delete<string>(this.url + "/" +  id);
 }
}
