# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#positions: admin and regular user
#users
#status
#priority
#escalation type

Position.create(id: 6, name:"admin", admin_permisions: true, created_at: DateTime.now, updated_at: DateTime.now)


User.create(id: 5, ecs_id:"gilesc", user_name: "ecsCraig", first_name:"Craig", last_name:"Giles", position_id: 6,
            main_phone: 123-123-1234, email:"gilesc@ecs.csus.edu", created_at:DateTime.now, updated_at:DateTime.now,
            show_description: true, show_catagory: false, show_priority: false, show_date_entered: false, show_date_completed: false, show_due_date: false,
            show_hours_worked: false, show_system_type: false, show_escalation: false, show_problem_type: false, show_room_number: false, show_computer_name: false,
            show_solution: false, show_status: false, show_submitted_by: false, show_completed_by: false, show_submitters_name: false, show_submitters_email: false,
            show_subject: true, email_signature: "gilesc@ecs.csus.edu" )

Category.create(id: 1, name: "category1", created_at: DateTime.now, updated_at: DateTime.now)

Escalation.create(id: 3, name: "escalation1", created_at: DateTime.now, updated_at: DateTime.now )

Priority.create(id: 1, name: "priority1", created_at: DateTime.now, updated_at: DateTime.now)

ProblemType.create(id: 1, name: "type1", created_at: DateTime.now, updated_at: DateTime.now)

Status.create(id: 1, name: "pending", created_at: DateTime.now, updated_at: DateTime.now, first_status: true, complete: false)
Status.create(id: 2, name: "active", created_at: DateTime.now, updated_at: DateTime.now, first_status: false, complete: false)
Status.create(id: 3, name: "hold", created_at: DateTime.now, updated_at: DateTime.now, first_status: false, complete: false)
Status.create(id: 4, name: "confirming completion", created_at: DateTime.now, updated_at: DateTime.now, first_status: false, complete: false)
Status.create(id: 5, name: "resolved", created_at: DateTime.now, updated_at: DateTime.now, first_status: false, complete: true)
Status.create(id: 6, name: "duplicate", created_at: DateTime.now, updated_at: DateTime.now, first_status: false, complete: true)
Status.create(id: 7, name: "self-fixed", created_at: DateTime.now, updated_at: DateTime.now, first_status: false, complete: true)

System.create(id: 1, name: "system1", created_at: DateTime.now, updated_at: DateTime.now)

ProblemReportRecord.create(subject: "ProblemReport1", description: "A description of problem report 1", category_id: 1, priority_id: 1, date_entered: DateTime.now, date_completed: DateTime.now, date_due: DateTime.now,
                    system_id: 1, escalation_id: 3, problem_type_id: 1, room_building: "Riverside", room_number: "5029", computer_name: "computer1", solution: "solution1", status_id: 1, submitted_by_id: 5,
                    completed_by_id: 5, submitters_name: "ecsCraig", submitters_email: "gilesc@ecs.csus.edu", created_at: DateTime.now, updated_at: DateTime.now)



