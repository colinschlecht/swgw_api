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

ActiveRecord::Schema.define(version: 2021_03_06_202859) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "character_questions", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "question_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_character_questions_on_character_id"
    t.index ["question_id"], name: "index_character_questions_on_question_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.string "bio"
    t.string "image"
    t.string "gender"
    t.string "skin_tone"
    t.integer "height"
    t.string "eye_color"
    t.string "hair_color"
    t.integer "mass"
    t.bigint "homeworld_id", null: false
    t.bigint "species_id", null: false
    t.integer "birth_year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["homeworld_id"], name: "index_characters_on_homeworld_id"
    t.index ["species_id"], name: "index_characters_on_species_id"
  end

  create_table "homeworlds", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "question"
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "attribute_desc"
    t.index ["category_id"], name: "index_questions_on_category_id"
  end

  create_table "species", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "character_questions", "characters"
  add_foreign_key "character_questions", "questions"
  add_foreign_key "characters", "homeworlds"
  add_foreign_key "characters", "species"
  add_foreign_key "questions", "categories"
end
