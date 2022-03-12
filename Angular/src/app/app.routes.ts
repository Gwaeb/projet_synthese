import { Routes } from '@angular/router';
import { AppComponent } from './components/app/app.component';
import { AddBuildComponent } from './components/builds/add-build/add-build.component';
import { BuildsListComponent } from './components/builds/builds-list/builds-list.component';
import { BuildsPage } from './components/builds/builds/builds.page';
import { EditBuildComponent } from './components/builds/edit-build/edit-build.component';
import { AddChampionsComponent } from './components/champions/add-champions/add-champions.component';
import { ChampionsListComponent } from './components/champions/champions-list/champions-list.component';
import { ChampionsComponent } from './components/champions/champions/champions.component';
import { EditChampionsComponent } from './components/champions/edit-champions/edit-champions.component';
import { E404Page } from './components/E404-page/E404.page';
import { ItemsPage } from './components/items/items/items.page';
import { NotificationPage } from './components/notification/notification/notification.page';
import { PlanningsPage } from './components/plannings/plannings/plannings.page';
import { AddFriendsPage } from './components/friends/add-friends/add-friends.page';
import { LoginTemplatePage } from './components/login-template/login-template.page';
import { LoginComponent } from './components/login/login/login.component';
import { SignupComponent } from './components/login/signup/signup.component';
import { MainTemplatePage } from './components/main-template/main-template.page';
import { MatchPage } from './components/match/match/match.page';
import { ProfilePage } from './components/profile/profile.page';
import { SkinsComponent } from './components/skins/skins/skins.component';
import { AuthGuard } from './guards/auth.guard';
import { LoginGuard } from './guards/login.guard';
import { SkinsListComponent } from './components/skins/skins-list/skins-list.component';
import { AddSkinsComponent } from './components/skins/add-skins/add-skins.component';
import { EditSkinsComponent } from './components/skins/edit-skins/edit-skins.component';
import { RunesPage } from './components/runes/runes/runes.page';
import { AddRunesPage } from './components/runes/add-runes/add-runes.page';
import { EditRunesPage } from './components/runes/edit-runes/edit-runes.page';
import { ProfileGuard } from './guards/profile.guard';
import { AddMatchComponent } from './components/match/add-match/add-match.component';
import { EditMatchPage } from './components/match/edit-match/edit-match.page';
import { AddPlanningComponent } from './components/plannings/add-planning/add-planning.component';
import { EditPlanningPage } from './components/plannings/edit-planning/edit-planning.page';
import { WelcomeComponent } from './components/welcome/welcome.component';

export const AppRoute: Routes = [
  {
    path: 'account',
    component: LoginTemplatePage,
    canActivate: [LoginGuard],
    canActivateChild: [LoginGuard],
    children: [
      { path: 'login', component: LoginComponent },
      { path: 'signup', component: SignupComponent },
    ],
  },

  {
    path: '',
    component: MainTemplatePage,
    canActivate: [AuthGuard],
    canActivateChild: [AuthGuard],
    children: [
      { path: '', component: WelcomeComponent },
      {
        path: 'champions',
        component: ChampionsComponent,
        children: [
          { path: '', component: ChampionsListComponent },
          { path: 'add', component: AddChampionsComponent },
          { path: 'edit/:id', component: EditChampionsComponent },
        ],
      },
      {
        path: 'skins',
        component: SkinsComponent,
        children: [
          { path: '', component: SkinsListComponent },
          { path: 'add', component: AddSkinsComponent },
          { path: 'edit/:id', component: EditSkinsComponent },
        ],
      },
      { path: 'runes', component: RunesPage },
      { path: 'runes/add', component: AddRunesPage },
      { path: 'runes/edit/:id', component: EditRunesPage },

      { path: 'items', component: ItemsPage },
      { path: 'builds', component: BuildsPage },
      { path: 'builds/add', component: AddBuildComponent },
      { path: 'builds/edit/:id', component: EditBuildComponent },

      { path: 'matches', component: MatchPage },
      { path: 'matches/add', component: AddMatchComponent },
      { path: 'matches/edit/:id', component: EditMatchPage },

      { path: 'plannings', component: PlanningsPage },
      { path: 'plannings/add', component: AddPlanningComponent },
      { path: 'plannings/edit/:id', component: EditPlanningPage },

      { path: 'friends', component: AddFriendsPage },
      { path: 'notifications', component: NotificationPage },
      {
        path: 'profile/:id',
        component: ProfilePage,
        canActivate: [ProfileGuard],
      },
    ],
  },

  { path: '**', component: E404Page },
];
