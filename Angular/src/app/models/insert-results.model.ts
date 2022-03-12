import {JSONObject, optional, required} from 'ts-json-object'

export class InsertResult extends JSONObject {

  @optional
  data!: any;

  @optional
  errors!: any[];

  @optional
  success!: boolean

}
