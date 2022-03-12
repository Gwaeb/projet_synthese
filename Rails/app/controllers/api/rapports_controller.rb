class Api::RapportsController < ApplicationController
    
    def champions
        
            @json = {champions: (Champion.find_by_sql ['select c.name, count(mh.id) as nombre_parties, count(CASE WHEN mh.victory = 1 THEN 1 END) as victoire, count(CASE WHEN victory = 0 THEN 1 END) as defaite, ((count(CASE WHEN mh.victory = 1 THEN 1 END)*100)/count(mh.id)) as pourcentage_victoire, ((count(CASE WHEN mh.victory = 0 THEN 1 END)*100)/count(mh.id)) as pourcentage_defaite from champions c, match_histories mh where mh.champion_id = c.id and ? = user_id group by c.id', current_user.id])}
            @json = @json.merge(positions: (Champion.find_by_sql ['select mh.position, count(mh.id) as nombre_parties, count(CASE WHEN mh.victory = 1 THEN 1 END) as victoire, count(CASE WHEN victory = 0 THEN 1 END) as defaite, cast(round(((count(CASE WHEN mh.victory = 1 THEN 1 END)*100)/count(mh.id)),2) as decimal(65,2)) as pourcentage_victoire, cast(round(((count(CASE WHEN mh.victory = 0 THEN 1 END)*100)/count(mh.id)),2) as decimal(65,2)) as pourcentage_defaite from champions c, match_histories mh where mh.champion_id = c.id and ? = user_id group by mh.position', current_user.id]))
            @json = @json.merge((Champion.find_by_sql ['select count(CASE WHEN victory = 1 THEN 1 END) as victoire_total,count(CASE WHEN victory = 0 THEN 1 END) as defaite_total, cast(round(((count(CASE WHEN mh.victory = 1 THEN 1 END)*100)/count(mh.id)),2) as decimal(65,2)) as pourcentage_total_victoire, cast(round(((count(CASE WHEN mh.victory = 0 THEN 1 END)*100)/count(mh.id)),2) as decimal(65,2)) as pourcentage_total_defaite   from match_histories mh where ? = user_id', current_user.id]).as_json[0])

            render json: @json 
    end

    def runes

            @json = (Champion.find_by_sql ['select rp.name as runes_page_name, count(*) as nb_time_used, (select count(*) from match_histories where victory = 1 and rune_page_id = rp.id) as victories, (select count(*) from match_histories where victory = 0 and rune_page_id = rp.id) as defeats, cast(round((select ((select count(*) from match_histories where victory = 1 and rune_page_id = rp.id) * 100 / (select count(*) from match_histories where rune_page_id = rp.id))), 2) as decimal(65,2)) as pourcentage_victories from rune_pages as rp, match_histories as mh where rp.id = mh.rune_page_id and mh.user_id = ? group by rp.id', current_user.id]).as_json

            render json: @json
 
    end

    def plannings

            @json = (User.find_by_sql ['    select distinct 
            u.name,
            (select count(distinct p.id) from friends_has_plannings ffhp inner join plannings p on ffhp.planning_id = p.id where ffhp.friend_id = u.id or p.creator_id = u.id) as total,
            (select count(CASE WHEN accepted_at IS NULL THEN 1 END) from friends_has_plannings ffhp where ffhp.friend_id = u.id) as pending, 
            (select count(CASE WHEN accepted_at IS NOT NULL THEN 1 END) from friends_has_plannings ffhp where ffhp.friend_id = u.id) as accepted,
    
    
            (select count(distinct p.id) from friends_has_plannings ffhp inner join plannings p on ffhp.planning_id = p.id where (ffhp.friend_id = u.id or p.creator_id = u.id) AND ((ffhp.friend_id = ? or p.creator_id = ?) or (ffhp.planning_id IN (select planning_id from friends_has_plannings where friend_id = ?)))) as total_commun,
            (select count(CASE WHEN accepted_at IS NULL THEN 1 END) from friends_has_plannings ffhp inner join plannings p on ffhp.planning_id = p.id where ffhp.friend_id = u.id  AND ((ffhp.friend_id = ? or p.creator_id = ?) or (ffhp.planning_id IN (select planning_id from friends_has_plannings where friend_id = ?))) ) as pending_commun, 
            (select count(CASE WHEN accepted_at IS NOT NULL THEN 1 END) from friends_has_plannings ffhp inner join plannings p on ffhp.planning_id = p.id where ffhp.friend_id = u.id  AND ((ffhp.friend_id = ? or p.creator_id = ?) or (ffhp.planning_id IN (select planning_id from friends_has_plannings where friend_id = ?))) ) as accepted_commun 
    
    
    
        from users u, friends f where  ((select count(ffhp.id) from friends_has_plannings ffhp inner join plannings p on ffhp.planning_id = p.id where ffhp.friend_id = u.id or p.creator_id = u.id) != 0) and u.id != ?;
    
            ', current_user.id,current_user.id,current_user.id,current_user.id,current_user.id,current_user.id,current_user.id,current_user.id,current_user.id,current_user.id])

            render json: @json

    end

end

