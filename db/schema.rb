ActiveRecord::Schema.define(version: 20151029073527) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "sub_description"
    t.string   "about"
    t.string   "facebook"
    t.string   "google_plus"
    t.string   "twitter"
    t.string   "linkedin"
    t.string   "dribble"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "address"
  end

end
