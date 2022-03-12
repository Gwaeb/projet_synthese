DROP PROCEDURE IF EXISTS `GetRapport`;


DELIMITER //

CREATE PROCEDURE GetRapport(IN current_user_id INTEGER)
BEGIN

    select distinct 
        u.name,
        (select count(distinct p.id) from friends_has_plannings ffhp inner join plannings p on ffhp.planning_id = p.id where ffhp.friend_id = u.id or p.creator_id = u.id) as total,
        (select count(CASE WHEN accepted_at IS NULL THEN 1 END) from friends_has_plannings ffhp where ffhp.friend_id = u.id) as pending, 
        (select count(CASE WHEN accepted_at IS NOT NULL THEN 1 END) from friends_has_plannings ffhp where ffhp.friend_id = u.id) as accepted,


        (select count(distinct p.id) from friends_has_plannings ffhp inner join plannings p on ffhp.planning_id = p.id where (ffhp.friend_id = u.id or p.creator_id = u.id) AND ((ffhp.friend_id = current_user_id or p.creator_id = current_user_id) or (ffhp.planning_id IN (select planning_id from friends_has_plannings where friend_id = current_user_id)))) as total_commun,
        (select count(CASE WHEN accepted_at IS NULL THEN 1 END) from friends_has_plannings ffhp inner join plannings p on ffhp.planning_id = p.id where ffhp.friend_id = u.id  AND ((ffhp.friend_id = current_user_id or p.creator_id = current_user_id) or (ffhp.planning_id IN (select planning_id from friends_has_plannings where friend_id = current_user_id))) ) as pending_commun, 
        (select count(CASE WHEN accepted_at IS NOT NULL THEN 1 END) from friends_has_plannings ffhp inner join plannings p on ffhp.planning_id = p.id where ffhp.friend_id = u.id  AND ((ffhp.friend_id = current_user_id or p.creator_id = current_user_id) or (ffhp.planning_id IN (select planning_id from friends_has_plannings where friend_id = current_user_id))) ) as accepted_commun 



    from users u, friends f where  ((select count(ffhp.id) from friends_has_plannings ffhp inner join plannings p on ffhp.planning_id = p.id where ffhp.friend_id = u.id or p.creator_id = u.id) != 0) and u.id != current_user_id;

	
END //

DELIMITER ;