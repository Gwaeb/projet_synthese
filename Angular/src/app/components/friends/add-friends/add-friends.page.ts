import { Component, OnInit } from '@angular/core';
import { Friend } from 'src/app/models/friend.model';
import { FriendsService } from 'src/app/services/friends.service';

@Component({
  selector: 'app-add-friends',
  templateUrl: './add-friends.page.html',
  styleUrls: ['./add-friends.page.scss']
})
export class AddFriendsPage implements OnInit {
  allFriends!: Friend[];
  filteredAllFriends!: Friend[];

  constructor(private friendService: FriendsService) {
    this.friendService.getFriends().subscribe((friend) => {
      this.allFriends = friend;
      this.filteredAllFriends = this.allFriends;
    });
  }

  ngOnInit(): void {
  }


  changeName(filter: string) {
    this.filteredAllFriends = this.allFriends;
    this.filteredAllFriends = this.filteredAllFriends.filter(friend => friend.name.toLowerCase().includes(filter));
  }



  removeFriend(friend: Friend) {

  }

  addFriend(friend: any) {

  }

}
