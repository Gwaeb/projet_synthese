import { custom, JSONObject, optional, required } from "ts-json-object";
import { Champion } from "./champion.model";
import { Skin } from "./skin.model";

export class ChampionWishList extends JSONObject {
  @required
  id!: number;

  @required
  champion!: Champion;
}
