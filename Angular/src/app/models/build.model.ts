import { custom, JSONObject, optional, required } from "ts-json-object";
import { Item } from "./item.model";

export class Build extends JSONObject {
  @optional
  id!: number;

  @required
  name!: string;

  @required
  @custom((build: Build, key:string, value: string) => {
    return Number(value);
  })
  category!: number;

  @required
  @custom((build: Build, key:string, value: any[]) => {
    return value.filter(e => e != null && <string>e != "null");
  })
  items!: Item[];

  @optional
  used!: number;

}
