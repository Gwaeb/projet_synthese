import { custom, JSONObject, optional, required } from "ts-json-object";

export class Champion extends JSONObject {
  @required
  id!: number;

  @required
  name!: string;

  @required
  description!: string;

  @required
  @custom((champion: Champion, key:string, value: string) => {
    return Number(value);
  })
  position!: number;

  @required
  price!: number;

  @required
  picture_path!: string;
}
