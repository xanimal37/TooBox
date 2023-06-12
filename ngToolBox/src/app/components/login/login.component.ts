import { Component, OnInit} from '@angular/core';
import { FormGroup, FormControl, Validators} from '@angular/forms';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
})
export class LoginComponent implements OnInit {

  loginForm: FormGroup | any;

  ngOnInit(): void {
      this.loginForm = new FormGroup({
        //username
        'username': new FormControl(null, Validators.required),
        'password': new FormControl(null, Validators.required)
        //password
      });
  }

  onSubmit():void {
    console.log(this.loginForm);
  }
}
