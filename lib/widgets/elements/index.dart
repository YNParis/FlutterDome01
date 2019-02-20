import 'form/index.dart' as form;
import 'frame/index.dart' as frame;
import 'media/index.dart' as media;

List getWidgets() {
  List result = [];
  result.addAll(form.getWidgets());
//  result.addAll(frame.getWidgets());
//  result.addAll(media.getWidgets());
  return result;
}