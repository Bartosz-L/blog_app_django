from django import forms
from .models import Comment


class EmailPostForm(forms.Form):
    name = forms.CharField(max_length=25)
    email = forms.EmailField()
    to = forms.EmailField()
    comments = forms.CharField(required=False, widget=forms.Textarea)


class CommentForm(forms.ModelForm):
    class Meta:
        model = Comment
        fields = ('name', 'email', 'body')
        widgets = {'name': forms.TextInput(attrs={'class': 'uk-input uk-form-width-large'}),
                   'email': forms.EmailInput(attrs={'class': 'uk-input uk-form-width-large'}),
                   'body': forms.Textarea(
                       attrs={'class': 'uk-textarea uk-form-width-large', 'style': 'resize: vertical'})
                   }
