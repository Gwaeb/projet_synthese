import { custom, JSONObject, optional, required } from 'ts-json-object';


export class RapportChampionPositionPosition extends JSONObject {

  @required
  position!: number;

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
