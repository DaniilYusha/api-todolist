after :projects do
  projects = Project.all
  15.times.each.with_index(1) do |_element, index|
    Task.create(
      name: FFaker::Name.first_name,
      position: index,
      project: projects.sample
    )
  end
end
