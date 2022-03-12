import { custom, JSONObject, optional, required } from 'ts-json-object';


export class RapportChampionPositionChampion extends JSONObject {

  @required
  name!: string;

  @required
  nombre_parties!: number;

  @required
  pourcentage_defaite!: string;

  @required
  pourcentage_victoire!: string;

  @required
  victoire!: number

  @required
  defaite!: number


}
