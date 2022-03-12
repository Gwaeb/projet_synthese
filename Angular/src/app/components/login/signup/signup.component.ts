import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators, AbstractControl, ValidationErrors } from '@angular/forms';
import { Router } from '@angular/router';
import { UserCredentials } from 'src/app/models/user-credentials.model';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-signin',
  templateUrl: './signup.component.html',
  styleUrls: ['./signup.component.scss']
})
export class SignupComponent implements OnInit {

  signupForm: FormGroup;
  emailControl: FormControl;
  nameControl: FormControl;
  passwordControl: FormControl;
  passwordConfirmationControl: FormControl;
  uniqueEmailError: string | null = null;
  nameBlankError: string | null = null;

  constructor(private authService: AuthService, private router: Router) {
    this.passwordControl = new FormControl(null, [
      Validators.required,
      Validators.minLength(6),
    ]);
    this.emailControl = new FormControl(null, [
      Validators.required,
      Validators.email
    ]);
    this.nameControl = new FormControl(null, [
      Validators.required
    ]);
    this.passwordConfirmationControl = new FormControl(null, [
      Validators.required,
      Validators.minLength(6),
    ]);

    this.signupForm = new FormGroup({
      email: this.emailControl,
      name:  this.nameControl,
      password: this.passwordControl,
      passwordConfirmation: this.passwordConfirmationControl
    }, this.passwordMatch);

  }

  private passwordMatch(form: AbstractControl): ValidationErrors | null {

    if (form.value?.password != form.value?.passwordConfirmation) {
      return { passwordConfirmationMustMatch: true };
    } else {
      return null
    }
  }

  ngOnInit(): void {
  }

  signUp(): void {
    this.authService.signUp(new UserCredentials(this.signupForm.value)).subscribe(result => {
      console.log('Sign up component', result);

      if (result?.success) {
        this.router.navigate(['/']);
      } else {
        console.log("errors",result?.errors[0])
        var errors = result?.errors[0];
        if (errors.email)
          this.setUniqueEmailError(true);
        if (errors.name)
          this.setNameError(true);
      }
    });
  }

  onEmailInput() {
    if (this.uniqueEmailError) {
      this.setUniqueEmailError(false);
      this.signupForm.get('email')?.updateValueAndValidity();
    }
  }

  onNameInput() {
    if (this.nameBlankError) {
      this.setNameError(false);
      this.signupForm.get('email')?.updateValueAndValidity();
    }
  }

  private setUniqueEmailError(isUsed: boolean) {
    this.uniqueEmailError = isUsed ? 'Ce courriel est déjà utilisé!' : null;
    this.signupForm.get('email')?.setErrors(isUsed ? { emailNotUnique: true } : null);
  }

  private setNameError(isUsed: boolean) {
    this.nameBlankError = isUsed ? 'Le nom d\'invocateur ne peut pas être vide!' : null;
    this.signupForm.get('name')?.setErrors(isUsed ? { nameBlank: true } : null);
  }

}
