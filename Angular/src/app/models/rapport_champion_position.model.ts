import { custom, JSONObject, optional, required } from 'ts-json-object';
import { RapportChampionPositionChampion } from './rapport_champion_position_champions.model';
import { RapportChampionPositionPosition } from './rapport_champion_position_positions.model';

export class RapportChampionPosition extends JSONObject {
  @required
  defaite_total!: number;

  @required
  victoire_total!: number;

  @required
  @custom((champion: RapportChampionPosition, key:string, value: string) => {
    return Number(value).toFixed(1);
  })
  pourcentage_total_victoire!: number;

  @required
  @custom((champion: RapportChampionPosition, key:string, value: string) => { return Number(value).toFixed(1);})
  pourcentage_total_defaite!: number;

  @optional
  champions!: RapportChampionPositionChampion[];

  @optional
  positions!: RapportChampionPositionPosition[];

}
