import { Component, OnInit } from '@angular/core';
import { Subject } from 'rxjs';
import { Build } from 'src/app/models/build.model';
import { ListSSF } from 'src/app/models/list-ssf.model';
import { BuildService } from 'src/app/services/build.service';

@Component({
  selector: 'app-builds-list',
  templateUrl: './builds-list.component.html',
  styleUrls: ['./builds-list.component.scss'],
})
export class BuildsListComponent implements OnInit {
  public static updateList: Subject<any> = new Subject();
  public static sortList: Subject<ListSSF> = new Subject();


  builds!: Build[];
  filteredBuilds!: Build[];


  build!: Build;
  show!: boolean;

  constructor(private buildService: BuildService) {
    BuildsListComponent.sortList.subscribe((res) => {
      this.updateBuildList(res);
    });
  }

  deleteResult(result: boolean) {
    if(result) this.buildService.deleteBuild(this.build).subscribe((e) => {
      if (e) this.ngOnInit()
      else alert("un problème est survenu");
    });
  }
  deleteBuild(build: Build) {
    this.build = build;
    this.show = true;
  }
  closeEvent() {
    this.show = false;
  }


  ngOnInit(): void {
    this.buildService.getBuilds().subscribe((e) => {
      this.builds = e;
      this.filteredBuilds = this.builds;
    });
  }


  updateBuildList(filter: ListSSF) {
    this.filteredBuilds = [];
    this.builds.forEach(e => this.filteredBuilds.push(e));

    if (filter.name) {
      this.filteredBuilds = this.filteredBuilds.filter(build => build.name.toLowerCase().includes(filter.name.toLowerCase()))
    }
    if (!isNaN(filter.filter)) {
      this.filteredBuilds = this.filteredBuilds.filter(build => build.category == filter.filter)
    }
    if (!isNaN(filter.sort)) {
      this.filteredBuilds = this.filteredBuilds.sort((a, b) => {
        if (filter.sort == 0) {
          return (a.name.toLowerCase() > b.name.toLowerCase())? 1 : (a.name.toLowerCase() < b.name.toLowerCase())? -1 : 0;
        }
        return 0;
      })
    }
  }
}
