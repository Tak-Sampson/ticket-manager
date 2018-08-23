# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

case Rails.env 
when "development"
  # users
  User.delete_all
  alice = User.create(name: 'Alice', email: 'foo@bar.com', password: 'password', password_confirmation: 'password')
  bob = User.create(name: 'Bob', email: 'baz@qux.com', password: '12345678', password_confirmation: '12345678')
  amy = User.create(name: 'Amy', email: 'bar@foo.com', password: 'password', password_confirmation: 'password')
  ben = User.create(name: 'Ben', email: 'qux@baz.com', password: '12345678', password_confirmation: '12345678')

  # projects
  Project.delete_all
  p1 = Project.create( name: 'project 1', description: 'my first project' )
  p2 = Project.create( name: 'project 2', description: 'my second project' )
  p3 = Project.create( name: 'project 3', description: 'my third project' )
  p4 = Project.create( name: 'project 4', description: 'my fourth project' )
  p5 = Project.create( name: 'project 5', description: 'my fifth project' )  

  # tickets
  Ticket.delete_all
  t1 = Ticket.create( name: 'p1t1', body: 'some ticket', project_id: p1.id, user_id: alice.id, assignee_id: amy.id )
  t2 = Ticket.create( name: 'p1t2', body: 'another ticket', project_id: p1.id, user_id: alice.id, assignee_id: ben.id )
  t3 = Ticket.create( name: 'p1t3', body: '3rd ticket', status: 1, project_id: p1.id, user_id: alice.id, assignee_id: alice.id )
  t4 = Ticket.create( name: 'p1t4', body: 'yet another ticket', status: 2, project_id: p1.id, user_id: alice.id, assignee_id: amy.id )
  t5 = Ticket.create( name: 'p1t5', body: 'foo ticket', status: 3, project_id: p1.id, user_id: alice.id, assignee_id: ben.id )
  t6 = Ticket.create( name: 'p1t6', body: 'bar ticket', status: 0, project_id: p1.id, user_id: alice.id, assignee_id: ben.id )
  t7 = Ticket.create( name: 'p2t1', body: 'baz ticket', status: 2, project_id: p2.id, user_id: alice.id )
  t8 = Ticket.create( name: 'p2t2', body: 'qux ticket', status: 1, project_id: p2.id, user_id: alice.id, assignee_id: bob.id )
  t9 = Ticket.create( name: 'p2t3', body: 'additional ticket', status: 1, project_id: p2.id, user_id: bob.id, assignee_id: amy.id  )
  t10 = Ticket.create( name: 'p3t1', body: 'more ticket', status: 3, project_id: p3.id, user_id: bob.id )
  t11 = Ticket.create( name: 'p3t2', body: 'ticket', status: 3, project_id: p3.id, user_id: bob.id, assignee_id: alice.id )
  t12 = Ticket.create( name: 'p4t1', body: 'hello world', status: 1, project_id: p4.id, user_id: bob.id, assignee_id: amy.id  )
  t13 = Ticket.create( name: 'p5t1', body: 'asdfasdf', status: 0, project_id: p5.id, user_id: bob.id, assignee_id: alice.id )
  t14 = Ticket.create( name: 'p5t2', body: 'foobar', status: 0, project_id: p5.id, user_id: bob.id )
  t15 = Ticket.create( name: 'p5t3', body: 'some ticket', status: 1, project_id: p5.id, user_id: bob.id, assignee_id: bob.id )

  # tags
  Tag.delete_all
  tag1 = Tag.create(name: 'news')
  tag2 = Tag.create(name: 'science')
  tag3 = Tag.create(name: 'tech')
  tag4 = Tag.create(name: 'funny')
  tag5 = Tag.create(name: 'lifestyle')
  tag6 = Tag.create(name: 'art')
  tag7 = Tag.create(name: 'sports')
  tag8 = Tag.create(name: 'cute')

  # ticket_tags
  TicketTag.delete_all
  
  TicketTag.create( ticket_id: t1.id, tag_id: tag1.id )
  TicketTag.create( ticket_id: t1.id, tag_id: tag2.id )
  TicketTag.create( ticket_id: t1.id, tag_id: tag3.id )
  TicketTag.create( ticket_id: t1.id, tag_id: tag5.id )
  TicketTag.create( ticket_id: t1.id, tag_id: tag8.id )

  TicketTag.create( ticket_id: t2.id, tag_id: tag4.id )
  TicketTag.create( ticket_id: t2.id, tag_id: tag6.id )
  TicketTag.create( ticket_id: t2.id, tag_id: tag7.id )

  TicketTag.create( ticket_id: t3.id, tag_id: tag1.id )
  TicketTag.create( ticket_id: t3.id, tag_id: tag4.id )
  TicketTag.create( ticket_id: t3.id, tag_id: tag7.id )

  TicketTag.create( ticket_id: t4.id, tag_id: tag8.id )

  TicketTag.create( ticket_id: t5.id, tag_id: tag5.id )

  TicketTag.create( ticket_id: t6.id, tag_id: tag3.id )

  TicketTag.create( ticket_id: t7.id, tag_id: tag1.id )
  TicketTag.create( ticket_id: t7.id, tag_id: tag5.id )

  TicketTag.create( ticket_id: t8.id, tag_id: tag2.id )

  TicketTag.create( ticket_id: t9.id, tag_id: tag3.id )

  TicketTag.create( ticket_id: t10.id, tag_id: tag2.id )
  TicketTag.create( ticket_id: t10.id, tag_id: tag7.id )
  TicketTag.create( ticket_id: t10.id, tag_id: tag8.id )

  TicketTag.create( ticket_id: t11.id, tag_id: tag2.id )
  TicketTag.create( ticket_id: t11.id, tag_id: tag3.id )

  TicketTag.create( ticket_id: t12.id, tag_id: tag1.id )

  TicketTag.create( ticket_id: t13.id, tag_id: tag1.id )

  TicketTag.create( ticket_id: t14.id, tag_id: tag3.id )

  TicketTag.create( ticket_id: t15.id, tag_id: tag5.id )
  TicketTag.create( ticket_id: t15.id, tag_id: tag6.id )
  TicketTag.create( ticket_id: t15.id, tag_id: tag8.id )


end