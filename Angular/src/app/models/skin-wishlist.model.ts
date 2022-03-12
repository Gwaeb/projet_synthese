import { custom, JSONObject, optional, required } from "ts-json-object";
import { Champion } from "./champion.model";
import { Skin } from "./skin.model";

export class SkinWishList extends JSONObject {
  @required
  id!: number;

  @required
  skin!: Skin;
}
