import { custom, JSONObject, optional, required } from 'ts-json-object';


export class RapportPlanning extends JSONObject {

  @required
  name!: string;

  @required
  total!: number;

  @required
  pending!: number;

  @required
  accepted!: number;

  @required
  total_commun!: number;

  @required
  pending_commun!: number;

  @required
  accepted_commun!: number;

}
