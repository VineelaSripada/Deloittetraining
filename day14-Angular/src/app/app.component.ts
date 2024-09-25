import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Student } from './models/student.models'
import { DataService } from './data.service';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [CommonModule, FormsModule],
  providers:[DataService ],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {

  public studentsArray:Student[] =[];

  public name:string = "";
  public  course:string = "";
  public email:string = "";
  public selectedSid:number = 0;

  constructor(private dataServiceObj: DataService) {
    
    }

  public getDataButtonClick()
  {                
      this.dataServiceObj.getAllStudents().subscribe((resData) =>
      {
        this.studentsArray = resData;
        //console.log(this.studentsArray);    
      })        
  }


  public deleteClick(sid:number){

    let flag:boolean = confirm("Do you want to delete?");

    if(flag == false)
    {
      return;
    }

    this.dataServiceObj.deleteStudentById(sid).subscribe((resData:any) =>
      {
        alert(resData.status);
        this.getDataButtonClick();
      });      
  }


  public selectClick(sid:number){
 
    this.dataServiceObj.getStudentById(sid).subscribe((resData:Student) =>
      {
        // console.log(resData);     
        this.selectedSid = resData.studentId;
        this.name = resData.name;
        this.email = resData.email;
        this.course = resData.course;


      });      
  }


  public addButtonClick()
  {                
      let obj:Student =  new Student();
      obj.studentId = 0;
      obj.name  = this.name;
      obj.course  = this.course;
      obj.email   = this.email;

      this.dataServiceObj.addStudent(obj).subscribe((resData:any) =>
      {
        alert(resData.status);
        this.getDataButtonClick();
        this.clearFields();
      });      
  }

  public clearFields(){
    this.name = "";
    this.email = "";
    this.course = "";
  }

  public updateButtonClick()
  {                
    let obj:Student =  new Student();
    obj.studentId = this.selectedSid;
    obj.name  = this.name;
    obj.course  = this.course;
    obj.email   = this.email;

    this.dataServiceObj.updateStudent(obj).subscribe((resData:any) =>
    {
      alert(resData.status);
      this.getDataButtonClick();
    });  
  }


}
