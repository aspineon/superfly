drop procedure if exists ui_link_group_actions;
delimiter $$
create procedure ui_link_group_actions(i_grop_id int(10), i_actions_list text)
 main_sql:
  begin
    insert into group_actions
          (
             grop_grop_id, actn_actn_id
          )
      select i_grop_id, acnt_id
        from     groups g
               join
                 actions a
               on a.ssys_ssys_id = g.ssys_ssys_id
                  and instr(concat(',', i_actions_list, ','),
                            concat(',', acnt_id, ',')
                     ) > 0
             left join
               group_actions ga
             on ga.grop_grop_id = g.grop_id and ga.actn_actn_id = a.actn_id
       where ga.gpac_id is null and g.grop_id = i_grop_id;

    select 'OK' status, null error_message;
  end
$$
delimiter ;
call save_routine_information('ui_link_group_actions',
                              concat_ws(',',
                                        'status varchar',
                                        'error_message varchar'
                              )
     );