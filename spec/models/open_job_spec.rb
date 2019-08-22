describe "OpenJob" do 
  let(:open_job) {OpenJob.new}

  it "has a open job id, job seeker id, and notes" do 
    open_job = OpenJob.create(title: "Manager", description: "Lording over others", level: 15, salary_range_from: 10000, salary_range_to: 65000, api_job_id: 65123)

    expect(open_job.title).to eq("Manager")
    expect(open_job.description).to eq("Lording over others")
    expect(open_job.salary_range_from).to eq(10000)
    expect(open_job.salary_range_to).to eq(65000)
    expect(open_job.api_job_id).to eq(65123)
  end
end 