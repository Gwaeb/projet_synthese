import { Component, OnInit } from '@angular/core';
import { Subject } from 'rxjs';
import { Planning } from 'src/app/models/planning.model';
import { PlanningService } from 'src/app/services/planning.service';

@Component({
  selector: 'app-notification',
  templateUrl: './notification.page.html',
  styleUrls: ['./notification.page.scss']
})
export class NotificationPage implements OnInit {
  plannings!: Planning[];
  public static updateList: Subject<any> = new Subject();

  constructor(private planningService: PlanningService) {
    NotificationPage.updateList.subscribe((res) => {
      this.ngOnInit();
    });
   }

  ngOnInit(): void {
    this.planningService.getPendingPlannings().subscribe(e => {
      this.plannings = e;
    })
  }

}
