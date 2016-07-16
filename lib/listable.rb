module Listable
  def position_on(list)
    on_which_list = listings.where(list: list,
                                   listable_id: id,
                                   listable_type: 'Task')[0]
    on_which_list.position
  end
end
