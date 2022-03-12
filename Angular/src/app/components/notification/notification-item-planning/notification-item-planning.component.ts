import { formatDate } from '@angular/common';
import { Component, Input, OnInit } from '@angular/core';
import { Planning } from 'src/app/models/planning.model';
import { PlanningService } from 'src/app/services/planning.service';
import { NotificationPage } from '../notification/notification.page';

@Component({
  selector: 'app-notification-item-planning',
  templateUrl: './notification-item-planning.component.html',
  styleUrls: ['./notification-item-planning.component.scss']
})
export class NotificationItemPlanningComponent implements OnInit {
  @Input() planning!: Planning;
  formattedDate!: string;
  invitedFriends!: string;

  constructor(private planningService: PlanningService) { }

  ngOnInit(): void {
    this.formattedDate = formatDate(
      new Date(this.planning.date),
      'dd-MM-yyyy hh:mm',
      'en_US'
    );
    this.invitedFriends = this.planning.friends.map(friend => friend.name).join(" - ")
  }

  accept() {
    this.planningService.acceptPlanning(this.planning.id.toString()).subscribe(e => {
      if (!!e?.success) NotificationPage.updateList.next(true);
    })
  }

  deny() {
    this.planningService.denyPlanning(this.planning.id.toString()).subscribe(e => {
      if (!!e?.success) NotificationPage.updateList.next(true);
    })
  }

}
