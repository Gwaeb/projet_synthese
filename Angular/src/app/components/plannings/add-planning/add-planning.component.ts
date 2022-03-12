import { formatDate } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators, FormArray } from '@angular/forms';
import { Router } from '@angular/router';
import { Friend } from 'src/app/models/friend.model';
import { Planning } from 'src/app/models/planning.model';
import { FriendsService } from 'src/app/services/friends.service';
import { PlanningService } from 'src/app/services/planning.service';

@Component({
  selector: 'app-add-planning',
  templateUrl: './add-planning.component.html',
  styleUrls: ['./add-planning.component.scss'],
})
export class AddPlanningComponent implements OnInit {
  addPlanningForm: FormGroup;
  allFriends!: Friend[];
  filteredAllFriends!: Friend[];
  dateErrors!: string;
  friendCount: number = 0;
  today: string = formatDate(
    Date.now(),
    'yyyy-MM-ddT00:00:00',
    'en_US',
    'UTC'
  );

  constructor(private friendService: FriendsService, private planningService: PlanningService, private router: Router) {
    this.friendService.getFriends().subscribe((friend) => {
      this.allFriends = friend;
      this.filteredAllFriends = this.allFriends;
    });
    this.addPlanningForm = new FormGroup({
      title: new FormControl(null, [Validators.required]),
      date: new FormControl(null, [Validators.required]),
      friends: new FormArray([
        new FormControl(null),
        new FormControl(null),
        new FormControl(null),
        new FormControl(null),
      ]),
    });
  }

  ngOnInit(): void {}

  changeName(filter: string) {
    this.filteredAllFriends = this.allFriends;
    this.filteredAllFriends = this.filteredAllFriends.filter(friend => friend.name.toLowerCase().includes(filter));
  }

  addPlanning(): void {
    this.addPlanningForm.value.friends = this.allFriends.filter(friend => friend.checked)

    this.planningService
      .addPlanning(new Planning(this.addPlanningForm.value))
      .subscribe((e) => {
        if (!!e?.success) this.router.navigate(['/plannings']);
        else {
          for (let key in e?.errors[0]) {
            if (key == "date") {
              this.dateErrors = key + " " + e?.errors[0][key];
            }
          }
        }
      });
  }

  changeSelection(friend: Friend, event: Event) {

    friend.checked = friend.checked? false: true;
    if (!this.canAddFriend()) {
      friend.checked = false;
      event.preventDefault();
      event.stopPropagation();
    } else {
      this.sortFriend();
    }
  }

  sortFriend() {
    this.filteredAllFriends = this.filteredAllFriends.sort((fa,fb) => {
      return (!!fa.checked < !!fb.checked)? 1 : (!!fa.checked > !!fb.checked)? -1 : 0;
    })
    this.friendCount = this.allFriends.filter(friend => friend.checked == true).length;
  }

  canAddFriend(): boolean {
    return this.allFriends.filter(friend => friend.checked == true).length <= 4;
  }


  cancel(): void {
    this.router.navigate(['/plannings']);
  }
}
