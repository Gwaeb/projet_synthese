import { i18nMetaToJSDoc } from '@angular/compiler/src/render3/view/i18n/meta';
import { Component, OnInit } from '@angular/core';
import { Subject } from 'rxjs';
import { ListSSF } from 'src/app/models/list-ssf.model';
import { Planning } from 'src/app/models/planning.model';
import { User } from 'src/app/models/user.model';
import { AuthService } from 'src/app/services/auth.service';
import { PlanningService } from 'src/app/services/planning.service';

@Component({
  selector: 'app-plannings-list',
  templateUrl: './plannings-list.component.html',
  styleUrls: ['./plannings-list.component.scss'],
})
export class PlanningsListComponent implements OnInit {
  public static updateList: Subject<any> = new Subject();
  public static sortList: Subject<ListSSF> = new Subject();

  plannings!: Planning[];
  filteredPlannings!: Planning[]

  planning!: Planning;
  show!: boolean;

  constructor(private planningsService: PlanningService, private authService: AuthService) {
    PlanningsListComponent.sortList.subscribe((res) => {
      this.updateChampList(res);
    });

  }

  deleteResult(result: boolean) {
    if(result) this.planningsService.deletePlanning(this.planning).subscribe((e) => {
      if (e) this.ngOnInit();
      else alert("un problème est survenu");
    });
  }
  deletePlanning(planning: Planning) {
    this.planning = planning;
    this.show = true;
  }
  closeEvent() {
    this.show = false;
  }

  ngOnInit(): void {
    this.planningsService.getPlannings().subscribe((p) => {
      this.plannings = p;
      this.filteredPlannings = this.plannings;
    });
  }

  get current_user(): User | null {
    return this.authService.currentUser;
  }

  updateChampList(filter: ListSSF) {
    this.filteredPlannings = [];
    this.plannings.forEach(e => this.filteredPlannings.push(e));

    if (filter.name) {
      this.filteredPlannings = this.filteredPlannings.filter(planning =>
        planning.title.toLowerCase().includes(filter.name.toLowerCase()) ||
        planning.friends.filter(e => e.name.toLowerCase().includes(filter.name.toLowerCase()))[0] ||
        planning.creator.name.toLowerCase().includes(filter.name.toLowerCase())
        )
    }
    if (!isNaN(filter.filter)) {
      if (filter.filter == 0) {
        this.filteredPlannings = this.filteredPlannings.filter(planning => planning.creator.id == this.current_user?.id);
      } else if (filter.filter == 1) {
        this.filteredPlannings = this.filteredPlannings.filter(planning => planning.friends.length < 4)
      } else if (filter.filter == 2) {
        this.filteredPlannings = this.filteredPlannings.filter(planning => new Date(planning.date) > new Date())
      }

    }
    if (!isNaN(filter.sort)) {
      this.filteredPlannings = this.filteredPlannings.sort((a, b) => {
        if (filter.sort == 0) {
          return (a.title.toLowerCase().normalize("NFD").replace(/\p{Diacritic}/gu, "") > b.title.toLowerCase().normalize("NFD").replace(/\p{Diacritic}/gu, ""))? 1 : (a.title.toLowerCase().normalize("NFD").replace(/\p{Diacritic}/gu, "") < b.title.toLowerCase().normalize("NFD").replace(/\p{Diacritic}/gu, ""))? -1 : 0;
        }
        return 0;
      })
    }
  }
}
