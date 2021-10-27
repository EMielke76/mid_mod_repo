require './lib/course'
require './lib/student'

RSpec.describe Course do
  context 'Iteration II' do
    let(:course) {Course.new("Calculus", 2)}
    let(:student1) {Student.new({name: "Morgan", age: 21})}
    let(:student2) {Student.new({name: "Jordan", age: 29})}

    describe "Course" do
      it 'exists' do

        expect(course).to be_a (Course)
      end

      it 'has attributes' do

        expect(course.name).to eq("Calculus")
        expect(course.capacity).to eq(2)
        expect(course.students).to eq([])
      end
    end

    describe '#full?' do
      it 'can tell if a couse is full' do

        expect(course.full?).to eq(false)
      end
    end

    describe '#enroll' do
      it 'can enroll students' do
        course.enroll(student1)
        course.enroll(student2)

        expect(course.students).to eq([student1, student2])
        expect(course.full?).to eq(true)
      end
    end
  end
end
