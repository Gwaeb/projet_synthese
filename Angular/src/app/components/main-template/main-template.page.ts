import { Component, OnInit } from '@angular/core';
import { Route, Router } from '@angular/router';
import { User } from 'src/app/models/user.model';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-main-template',
  templateUrl: './main-template.page.html',
  styleUrls: ['./main-template.page.scss'],
})
export class MainTemplatePage implements OnInit {
  menuHamburger: boolean = false;
  menuUser: boolean = false;

  constructor(private authService: AuthService, private router: Router) {}
  get current_user(): User | null {
    return this.authService.currentUser;
  }

  ngOnInit(): void {}

  clicMenuHamburger() {
    this.menuHamburger = !this.menuHamburger;
    if (this.menuUser) {
      this.menuUser = false;
    }
  }
  clicMenuUser() {
    this.menuUser = !this.menuUser;
    if (this.menuHamburger) {
      this.menuHamburger = false;
    }
  }

  closeMenus(): void {
    this.menuHamburger = false;
    this.menuUser = false;
  }

  profile() {
    console.log(this.current_user);
    this.router.navigate([`/profile/${this.current_user?.id}`]);
  }

  logOut() {
    this.authService.signOut().subscribe((e) => {
      this.router.navigate(['/account/login']);
    });
  }
}
