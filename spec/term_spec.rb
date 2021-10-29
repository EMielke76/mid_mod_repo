require './lib/course'
require './lib/student'
require './lib/term'

RSpec.describe Term do
  context 'Iteration III' do
  let(:term) {Term.new("Winter 2018")}

  let(:painting) {Course.new("Painting", 2)}
  let(:cooking) {Course.new("Cooking", 3)}
  let(:writing) {Course.new("Painting", 4)}

  let(:bob) {Student.new({name: "Bob", age: 30})}
  let(:brian) {Student.new({name: "Brian", age: 33})}
  let(:jess) {Student.new({name: "Jess", age: 32})}
    describe 'Term' do

      it 'exists' do

        expect(term).to be_a(Term)
      end

      it 'has a name' do

        expect(term.name).to eq("Winter 2018")
      end

      it 'can have multiple courses' do

        expect(term.courses).to eq([])
      end

      it 'can add courses' do
        term.add_course(painting)
        term.add_course(writing)

        expect(term.courses).to eq([painting, writing])
      end
    end

    describe 'courses' do

      it 'can list call courses that are open' do
        term.add_course(painting)
        term.add_course(cooking)
        term.add_course(writing)

        painting.enroll(bob)
        painting.enroll(brian)

        expect(term.available_courses).to eq([cooking, writing])
      end
    end

    describe '#list_all_student_names' do

      it 'can list all enrolled students' do
        term.add_course(painting)
        term.add_course(cooking)
        term.add_course(writing)

        painting.enroll(bob)
        painting.enroll(brian)
        writing.enroll(jess)

        expect(term.all_student_names).to eq(["Bob", "Brian", "Jess"])
      end
    end

    describe 'Gathering Tuition' do
      before :each do
        term.add_course(painting)
        term.add_course(cooking)
        term.add_course(writing)

        painting.enroll(bob)
        cooking.enroll(bob)
        writing.enroll(bob)

        painting.enroll(brian)
        cooking.enroll(brian)

        writing.enroll(jess)
      end
      #Tuition is based on how many classes student is enrolled it
      # Student is elligible for scholarship/discounted tuition
      #if their average grade accross all courses meets a criteria
      it 'can count the number of courses a student is enrolled in' do

        expect(term.number_of_courses(bob)).to eq(3)
        expect(term.number_of_courses(brian)).to eq(2)
        expect(term.number_of_courses(jess)).to eq(1)
      end

      it 'can determine if student is elligible for scholarship' do
        bob.log_score(90)
        bob.log_score(90)
        bob.log_score(90)

        brian.log_score(90)
        brian.log_score(90)

        jess.log_score(100)

        expect(term.scholarship_elligible(bob)).to eq(true)
        expect(term.scholarship_elligible(brian)).to eq(false)
        expect(term.scholarship_elligible(jess)).to eq(false)
      end

      it 'can calculate tuition' do
        bob.log_score(90)
        bob.log_score(90)
        bob.log_score(90)

        brian.log_score(90)
        brian.log_score(90)

        jess.log_score(100)

        expect(term.tuition_owed(bob)).to eq("$480.0")
        expect(term.tuition_owed(brian)).to eq("$400.0")
        expect(term.tuition_owed(jess)).to eq("$200.0")
      end
    end
  end
end
