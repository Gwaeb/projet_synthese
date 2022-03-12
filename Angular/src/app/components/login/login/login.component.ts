import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss'],
})
export class LoginComponent implements OnInit {
  loginForm: FormGroup;
  passwordControl: FormControl;
  emailControl: FormControl;
  authError: string | null = null;

  constructor(private authService: AuthService, private router: Router) {
    this.passwordControl = new FormControl(null, [
      Validators.required,
      Validators.minLength(6),
    ]);
    this.emailControl = new FormControl(null, [
      Validators.required,
      Validators.email,
    ]);
    this.loginForm = new FormGroup({
      email: this.emailControl,
      password: this.passwordControl,
    });
  }

  ngOnInit(): void {}

  logIn(): void {
    this.authService.logIn(this.loginForm.value).subscribe((result) => {
      console.log('Login component', result);

      if (!!result?.success) {
        this.router.navigate(['/']);
      } else {
        this.authError = result?.errors.toString() || 'Informations invalides';
      }
    });
  }
}
