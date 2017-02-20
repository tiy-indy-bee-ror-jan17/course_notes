# Basic test requires
require 'minitest/autorun'
require 'minitest/pride'
require 'faker'

# Include both the migration and the app itself
require './migration'
require './application'

# Overwrite the development database connection with a test connection.
ActiveRecord::Base.establish_connection(
  adapter:  'sqlite3',
  database: 'test.sqlite3'
)

ActiveRecord::Base.logger = Logger.new(STDOUT)

# Gotta run migrations before we can run tests.  Down will fail the first time,
# so we wrap it in a begin/rescue.
begin ApplicationMigration.migrate(:down); rescue; end
ApplicationMigration.migrate(:up)


# Finally!  Let's test the thing.
class ApplicationTest < Minitest::Test

  def setup
    @user = User.find_or_create_by(
                first_name: "Chuck",
                last_name: "Xavier"
            )
    p @user
    assert @user.persisted?
  end

  def test_truth
    assert true
  end

  def test_another
    refute false
  end

  def test_making_a_note
    note = Note.new
    note.body = Faker::Lorem.paragraph
    note.user = @user
    note.notable = @user
    assert note.save
    p note
    assert note.notable == @user
  end

  def test_leaving_a_note_on_a_note
    note1 = Note.create(
      body: Faker::Lorem.paragraph,
      user: @user,
      notable: @user
    )
    note2 = Note.create(
      body: Faker::Lorem.paragraph,
      user: @user,
      notable: note1
    )
    p note2
    assert note2.persisted?
    assert note2.notable == note1
    assert note1.notes.length == 1
    assert note1.notes.first == note2

  end

  def test_user_to_notes
    user2 = User.create(last_name: Faker::Name.last_name)
    assert user2.persisted?
    assert user2.notes.count == 0
    assert user2.left_notes.count == 0
    note = Note.create(
      body: Faker::Lorem.paragraph,
      user: user2,
      notable: user2
    )
    assert user2.notes.count == 1
    assert user2.left_notes.count == 1
    assert user2.notes.first == note
    assert user2.left_notes.first == note
  end

  def test_notes_left_on_assignment
    assignment = Assignment.create!
    note = Note.create(
      body: Faker::Lorem.paragraph,
      user: @user,
      notable: assignment
    )
    assert note.persisted?
    assert note.notable == assignment
    assert assignment.notes.count == 1
    assert assignment.notes.first == note
  end

  def test_a_course_has_students
    course = Course.create!
    course.students << @user
    assert course.students.count == 1
    assert course.students.first == @user
    p course.course_students.first
    assert course.course_students.count == 1
    assert @user.courses.length == 1
    assert @user.enrolled?(course)
    assert @user.student?
  end

  def test_add_a_protocol_if_left_off
    @user.photo_url = "robohash.org/whatever.png"
    assert @user.save
    assert @user.photo_url == "http://robohash.org/whatever.png"
  end

  def test_blank_note_creation
    note = Note.new
    refute note.save
  end

  def test_no_user_on_note
    puts "\n\n========== LOOKEE HERE ============\n\n"
    course = Course.create!
    note = Note.new(
      notable: course
    )
    refute note.save
    assert note.errors.full_messages.include? "User can't be blank"
  end

  def test_no_notable_on_note
    note = Note.new(
      user: @user
    )
    refute note.save
    assert note.errors.full_messages.include? "Notable can't be blank"
  end

end
