class Item extends React.Component {
  render () {
    return (
      <div>
        <div>Name: {this.props.name}</div>
        <div>Type: {this.props.type}</div>
        <div>Posted At: {this.props.postedAt}</div>
        <div>Posted By: {this.props.postedBy}</div>
        <div>Posted For: {this.props.postedFor}</div>
      </div>
    );
  }
}

Item.propTypes = {
  name: React.PropTypes.string,
  type: React.PropTypes.string,
  postedAt: React.PropTypes.instanceOf(Date),
  postedBy: React.PropTypes.instanceOf(User),
  postedFor: React.PropTypes.instanceOf(User)
};
