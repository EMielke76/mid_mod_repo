require './lib/student'

RSpec.describe Student do
  context 'Iteration I' do
    let(:student) {Student.new({name: "Morgan", age: 21})}

    describe 'Student' do
      it 'exists' do

        expect(student).to be_a(Student)
      end

      it 'has attributes' do

        expect(student.name).to eq("Morgan")
        expect(student.age).to eq(21)
        expect(student.scores).to eq([])
      end
    end
    describe '#log_score' do
      it 'can record a score' do
        student.log_score(89)
        student.log_score(78)

        expect(student.scores).to eq([89, 78])
      end
    end
    describe '#grade' do
      it 'can display an average of all scores' do
        student.log_score(89)
        student.log_score(78)

        expect(student.grade).to eq(83.5)
      end
    end
  end
end
