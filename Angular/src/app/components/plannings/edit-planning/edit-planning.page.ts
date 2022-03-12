import { formatDate } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators, FormArray } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { Friend } from 'src/app/models/friend.model';
import { Planning } from 'src/app/models/planning.model';
import { FriendsService } from 'src/app/services/friends.service';
import { PlanningService } from 'src/app/services/planning.service';

@Component({
  selector: 'app-edit-planning',
  templateUrl: './edit-planning.page.html',
  styleUrls: ['./edit-planning.page.scss']
})
export class EditPlanningPage implements OnInit {

  editPlanningForm: FormGroup;
  allFriends!: Friend[];
  filteredAllFriends!: Friend[];
  dateErrors!: string;
  id!: string | null;
  friendCount: number = 0;
  today: string = formatDate(
    Date.now(),
    'yyyy-MM-ddThh:mm',
    'en_US',
    'UTC'
  );

  constructor(private friendService: FriendsService, private planningService: PlanningService, private router: Router, private route: ActivatedRoute) {


    this.editPlanningForm = new FormGroup({
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

  ngOnInit(): void {
    this.route.paramMap.subscribe(e => {
      this.id = e.get("id");
      this.planningService.getPlanning(this.id).subscribe(planning => {
        this.friendService.getFriends().subscribe((friend) => {
          this.allFriends = friend;
          this.filteredAllFriends = this.allFriends;

          this.allFriends = this.allFriends.map(friend => {
            friend.checked = !!planning?.friends.filter(f => f.id == friend.id)[0]
            return friend;
          })
          this.sortFriend();
          this.editPlanningForm.setValue({title: planning?.title, date: planning?.date.substring(0, planning.date.length-8), friends: [null,null,null,null]});
        });
      })
    })

  }

  changeName(filter: string) {
    this.filteredAllFriends = this.allFriends;
    this.filteredAllFriends = this.filteredAllFriends.filter(friend => friend.name.toLowerCase().includes(filter));
  }

  editPlanning(): void {
    this.editPlanningForm.value.friends = this.allFriends.filter(friend => friend.checked)
    this.editPlanningForm.value.id = Number(this.id);
    this.planningService
      .updatePlanning(new Planning(this.editPlanningForm.value))
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
