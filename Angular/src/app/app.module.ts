import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './components/app/app.component';
import { ItemsPage } from './components/items/items/items.page';
import { ItemsListComponent } from './components/items/items-list/items-list.component';
import { ItemsListItemComponent } from './components/items/items-list-item/items-list-item.component';
import { BuildsPage } from './components/builds/builds/builds.page';
import { BuildsListComponent } from './components/builds/builds-list/builds-list.component';
import { BuildsListItemComponent } from './components/builds/builds-list-item/builds-list-item.component';
import { AddBuildComponent } from './components/builds/add-build/add-build.component';
import { MatchPage } from './components/match/match/match.page';
import { MatchListComponent } from './components/match/match-list/match-list.component';
import { MatchListItemComponent } from './components/match/match-list-item/match-list-item.component';
import { AddMatchComponent } from './components/match/add-match/add-match.component';
import { LoginTemplatePage } from './components/login-template/login-template.page';
import { MainTemplatePage } from './components/main-template/main-template.page';
import { LoginComponent } from './components/login/login/login.component';
import { SignupComponent } from './components/login/signup/signup.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { ChampionsComponent } from './components/champions/champions/champions.component';
import { ChampionsListComponent } from './components/champions/champions-list/champions-list.component';
import { ChampionsListItemComponent } from './components/champions/champions-list-item/champions-list-item.component';
import { SkinsComponent } from './components/skins/skins/skins.component';
import { SkinsListComponent } from './components/skins/skins-list/skins-list.component';
import { SkinsListItemComponent } from './components/skins/skins-list-item/skins-list-item.component';
import { ProfilePage } from './components/profile/profile.page';
import { E404Page } from './components/E404-page/E404.page';
import { EditBuildComponent } from './components/builds/edit-build/edit-build.component';
import { AddBuildItemComponent } from './components/builds/add-build-item/add-build-item.component';
import { AddChampionsComponent } from './components/champions/add-champions/add-champions.component';
import { EditChampionsComponent } from './components/champions/edit-champions/edit-champions.component';
import { AddPlanningComponent } from './components/plannings/add-planning/add-planning.component';
import { PlanningsPage } from './components/plannings/plannings/plannings.page';
import { PlanningsListComponent } from './components/plannings/plannings-list/plannings-list.component';
import { PlanningsListItemComponent } from './components/plannings/plannings-list-item/plannings-list-item.component';

import { AddSkinsComponent } from './components/skins/add-skins/add-skins.component';
import { EditSkinsComponent } from './components/skins/edit-skins/edit-skins.component';

import { NotificationPage } from './components/notification/notification/notification.page';
import { RunesPage } from './components/runes/runes/runes.page';
import { AddRunesPage } from './components/runes/add-runes/add-runes.page';
import { EditRunesPage } from './components/runes/edit-runes/edit-runes.page';
import { RunesListComponent } from './components/runes/runes-list/runes-list.component';
import { RunesListItemComponent } from './components/runes/runes-list-item/runes-list-item.component';
import { ImgRunesComponent } from './components/runes/img-runes/img-runes.component';
import { EditMatchPage } from './components/match/edit-match/edit-match.page';
import { DeleteComponent } from './components/modals/delete/delete.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { EditPlanningPage } from './components/plannings/edit-planning/edit-planning.page';
import { WelcomeComponent } from './components/welcome/welcome.component';
import { NotificationItemPlanningComponent } from './components/notification/notification-item-planning/notification-item-planning.component';
import { AddFriendsPage } from './components/friends/add-friends/add-friends.page';

@NgModule({
  declarations: [
    AppComponent,
    ItemsPage,
    ItemsListComponent,
    ItemsListItemComponent,
    BuildsPage,
    BuildsListComponent,
    BuildsListItemComponent,
    AddBuildComponent,
    MatchPage,
    MatchListComponent,
    MatchListItemComponent,
    AddMatchComponent,
    LoginTemplatePage,
    MainTemplatePage,
    LoginComponent,
    SignupComponent,
    ChampionsComponent,
    ChampionsListComponent,
    ChampionsListItemComponent,
    SkinsComponent,
    SkinsListComponent,
    SkinsListItemComponent,
    ProfilePage,
    E404Page,
    EditBuildComponent,
    AddBuildItemComponent,
    AddChampionsComponent,
    EditChampionsComponent,
    PlanningsPage,
    PlanningsListComponent,
    PlanningsListItemComponent,
    AddPlanningComponent,
    AddSkinsComponent,
    EditSkinsComponent,

    EditPlanningPage,
    NotificationPage,
    NotificationItemPlanningComponent,
    RunesPage,
    AddRunesPage,
    EditRunesPage,
    RunesListComponent,
    RunesListItemComponent,
    ImgRunesComponent,
    EditMatchPage,
    DeleteComponent,
    AddFriendsPage,
    WelcomeComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    ReactiveFormsModule,
    HttpClientModule,
    BrowserAnimationsModule,
  ],
  providers: [],
  bootstrap: [AppComponent],
})
export class AppModule {}
