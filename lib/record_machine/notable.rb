# module for those objects that can recieve a note
module Notable
  def add_new_note(name, text)
    note = Note.create!(name: name, text: text)
    ListedItem.create!(
      listable_id: note.id,
      listable_type:  'Note',
      list_id: id,
      # TODO make live user
      user_id: 1
    )
    note
  end

  def add_note(note_id)
    note = Note.find(note_id)
    ListedItem.create!(
      listable_id: note_id,
      listable_type: 'Note',
      list_id: id
    )
    true
  end

  def notes
    listed_notes = ListedItem.where(list_id: id, listable_type: 'Note')
    Note.where(id: listed_notes)
  end
end
