# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160121164030) do

  create_table "agencias", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "atendentes", force: :cascade do |t|
    t.integer  "agencia_id"
    t.boolean  "adm"
    t.integer  "funcionario_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "atendentes", ["agencia_id"], name: "index_atendentes_on_agencia_id"
  add_index "atendentes", ["funcionario_id"], name: "index_atendentes_on_funcionario_id"

  create_table "cemiterios", force: :cascade do |t|
    t.string   "nome"
    t.integer  "velorio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cemiterios", ["velorio_id"], name: "index_cemiterios_on_velorio_id"

  create_table "funcionarios", force: :cascade do |t|
    t.string   "nome"
    t.string   "password_digest"
    t.string   "rf"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "funcionarios", ["rf"], name: "index_funcionarios_on_rf", unique: true

  create_table "reservas", force: :cascade do |t|
    t.datetime "contratacao"
    t.datetime "sepultamento"
    t.integer  "atendente_id"
    t.integer  "sala_id"
    t.integer  "cemiterio_id"
    t.string   "d_obito"
    t.string   "falecido"
    t.string   "municipe"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.boolean  "mesmo_local"
    t.integer  "velorio_id"
    t.boolean  "excluida"
  end

  add_index "reservas", ["atendente_id"], name: "index_reservas_on_atendente_id"
  add_index "reservas", ["cemiterio_id"], name: "index_reservas_on_cemiterio_id"
  add_index "reservas", ["sala_id"], name: "index_reservas_on_sala_id"
  add_index "reservas", ["velorio_id"], name: "index_reservas_on_velorio_id"

  create_table "salas", force: :cascade do |t|
    t.boolean  "especial"
    t.integer  "velorio_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.boolean  "desabilitada"
  end

  add_index "salas", ["velorio_id"], name: "index_salas_on_velorio_id"

  create_table "velorios", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "cemiterio_id"
  end

  add_index "velorios", ["cemiterio_id"], name: "index_velorios_on_cemiterio_id"

  create_table "veloristas", force: :cascade do |t|
    t.integer  "velorio_id"
    t.integer  "funcionario_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "veloristas", ["funcionario_id"], name: "index_veloristas_on_funcionario_id"
  add_index "veloristas", ["velorio_id"], name: "index_veloristas_on_velorio_id"

end
