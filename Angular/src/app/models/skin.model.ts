import { custom, JSONObject, optional, required } from "ts-json-object";
import { Champion } from "./champion.model";

export class Skin extends JSONObject {
  @required
  id!: number;

  @required
  name!: string;

  @required
  price!: number;

  @required
  champion!: Champion;

  @required
  picture_path!: string;
}
