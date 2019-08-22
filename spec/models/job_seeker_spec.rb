require_relative '../spec_helper.rb'

describe "JobSeeker" do 
  let(:job_seeker) {JobSeeker.new}

  it "has a name, desired salary, and GS level" do 
    job_seeker = JobSeeker.create(:name => "Jon", :desired_salary => 100000, :level => 10 )

    expect(job_seeker.name).to eq("Jon")
    expect(job_seeker.desired_salary).to eq(100000)
    expect(job_seeker.level).to eq(10)
  end



  describe '#parse_job_data' do
    it 'returns data as an hash' do
      result = job_seeker.parse_job_data(87990)
      expect(result).to be_a Hash
    end

    it "includes correct keys" do
      result = job_seeker.parse_job_data(87990)
      expect(result).to have_key("business_title")
      expect(result).to have_key("job_description")
      expect(result).to have_key("level")
      expect(result).to have_key("salary_range_from")
      expect(result).to have_key("salary_range_to")
      expect(result).to have_key("job_id")
      # expect(job_data.first).to have_key(:title)
    end
  end


end