import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { RapportChampionPosition } from 'src/app/models/rapport_champion_position.model';
import { RapportPlanning } from 'src/app/models/rapport_planning.model';
import { RapportRune } from 'src/app/models/rapport_rune.model';
import { User } from 'src/app/models/user.model';
import { AuthService } from 'src/app/services/auth.service';
import { RapportsService } from 'src/app/services/rapports.service';

@Component({
  selector: 'app-profile',
  templateUrl: './profile.page.html',
  styleUrls: ['./profile.page.scss'],
})
export class ProfilePage implements OnInit {
  user!: User | null;

  rapportMaxime!: RapportChampionPosition | null;
  nbMatchTotal: number = 0;
  positions: string[] = ['Haut', 'Jungle', 'Milieu', 'Bas', 'Support'];
  rapportGabriel!: RapportRune[] | null;
  rapportMathieu!: RapportPlanning[] | null;

  constructor(
    private authService: AuthService,
    private activatedRoute: ActivatedRoute,
    private router: Router,
    private rapportSercive: RapportsService
  ) {
    this.activatedRoute.paramMap.subscribe((params) => {
      const id = params.get('id');
      this.authService.getUserById(id).subscribe((e) => {
        this.user = e;
        if (!e == true)
          this.router.navigate([`/profile`, this.authService.currentUser?.id]);
      });
    });
  }

  ngOnInit(): void {
    this.rapportSercive.getRapportRune().subscribe((e) => {
      this.rapportGabriel = e;
    });
    this.rapportSercive.getRapportChampionPosition().subscribe((e) => {
      this.rapportMaxime = e;
      this.rapportMaxime?.champions.map((element) => {
        this.nbMatchTotal += element.nombre_parties;
        element.pourcentage_defaite = Number(element.pourcentage_defaite).toFixed(1);
        element.pourcentage_victoire = Number(element.pourcentage_victoire).toFixed(1);
        return element;
      });
      this.rapportMaxime?.positions.map((element) => {
        element.pourcentage_defaite = Number(element.pourcentage_defaite).toFixed(1);
        element.pourcentage_victoire = Number(element.pourcentage_victoire).toFixed(1);
        return element;
      });
    });
    this.rapportSercive.getRapportPlanning().subscribe((e) => {
      this.rapportMathieu = e;
    });
  }
}
