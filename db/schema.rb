# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_07_012919) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.bigint "meeting_room_id", null: false
    t.bigint "user_id", null: false
    t.datetime "initial_date"
    t.datetime "end_date"
    t.string "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["meeting_room_id"], name: "index_appointments_on_meeting_room_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.bigint "room_specification_id", null: false
    t.string "image_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["room_specification_id"], name: "index_images_on_room_specification_id"
  end

  create_table "meeting_rooms", force: :cascade do |t|
    t.bigint "room_localization_id", null: false
    t.bigint "room_specification_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["room_localization_id"], name: "index_meeting_rooms_on_room_localization_id"
    t.index ["room_specification_id"], name: "index_meeting_rooms_on_room_specification_id"
  end

  create_table "room_localizations", force: :cascade do |t|
    t.string "floor"
    t.string "number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "room_specifications", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "max_person"
    t.boolean "has_data_show"
    t.boolean "has_board"
    t.boolean "has_split"
    t.string "size"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "userRole"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "appointments", "meeting_rooms"
  add_foreign_key "appointments", "users"
  add_foreign_key "images", "room_specifications"
  add_foreign_key "meeting_rooms", "room_localizations"
  add_foreign_key "meeting_rooms", "room_specifications"

  create_view "rooms", sql_definition: <<-SQL
      SELECT meeting_rooms.id,
      room_specifications.name,
      room_specifications.description,
      room_specifications.max_person,
      room_specifications.has_data_show,
      room_specifications.has_split,
      room_specifications.size,
      room_specifications.has_board,
      room_localizations.floor,
      room_localizations.number,
      images.image_url
     FROM (((meeting_rooms
       JOIN room_specifications ON ((meeting_rooms.room_specification_id = room_specifications.id)))
       JOIN room_localizations ON ((meeting_rooms.room_localization_id = room_localizations.id)))
       JOIN images ON ((meeting_rooms.room_specification_id = images.room_specification_id)))
    GROUP BY meeting_rooms.id, room_specifications.name, room_specifications.description, room_specifications.max_person, room_specifications.has_data_show, room_specifications.has_split, room_specifications.size, room_specifications.has_board, room_localizations.floor, images.image_url, room_localizations.number;
  SQL
end
